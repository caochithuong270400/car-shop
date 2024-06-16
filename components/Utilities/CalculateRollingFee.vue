<template>
  <v-container>
    <v-card>
      <v-card-title style="color: var(--light-title-color)"
        >TÍNH PHÍ LĂN BÁNH</v-card-title
      >
      <v-divider></v-divider>
      <v-card-text>
        <!-- <v-row>
          <v-col cols="12">
            <v-autocomplete
              :items="[
                'California',
                'Colorado',
                'Florida',
                'Georgia',
                'Texas',
                'Wyoming',
              ]"
              variant="outlined"
              label="Bình Dương"
            >
            </v-autocomplete>
          </v-col>
        </v-row> -->

        <v-row
          v-if="store.data.products?.length > 1 && have_car_type === false"
        >
          <v-col cols="12">
            <v-autocomplete
              v-model="car_type_id"
              :items="store.data.products"
              item-title="name"
              item-value="car_id"
              variant="outlined"
              label="Chọn tên xe"
            >
            </v-autocomplete>
          </v-col>
        </v-row>

        <v-row v-if="store.data.choosed_car?.details">
          <v-col cols="12">
            <v-autocomplete
              v-model="car_version_id"
              :items="store.data.choosed_car.details"
              item-title="version"
              item-value="car_detail_id"
              variant="outlined"
              label="Chọn phiên bản"
            >
            </v-autocomplete>
          </v-col>
        </v-row>
        <v-row v-if="store.data.choosed_car_detail">
          <v-col>
            <v-row style="margin: 0 5%">
              <v-col cols="6" class="col_margin">Giá (VNĐ):</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  storeMethod.formatMoney(store.data.choosed_car_detail.price)
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin">Phí trước bạ:</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  (store.data.choosed_car.VRT = storeMethod.formatMoney(
                    store.data.choosed_car_detail.price / 10
                  ))
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin">Phí đăng ký:</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  (store.data.choosed_car.VRF =
                    storeMethod.formatMoney(1000000))
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin"
                >Bảo hiểm Vật Chất: (1.6%)</v-col
              >
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  (store.data.choosed_car.material_covered =
                    storeMethod.formatMoney(
                      (store.data.choosed_car_detail.price * 1.6) / 100
                    ))
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin">Phí đường bộ:</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  (store.data.choosed_car.road_fee =
                    storeMethod.formatMoney(1560000))
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin">Đăng Kiểm:</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  (store.data.choosed_car.vehicle_inspection =
                    storeMethod.formatMoney(340000))
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin">Dịch Vụ Đăng Ký:</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  (store.data.choosed_car.registration_service =
                    storeMethod.formatMoney(3000000))
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin">Bảo Hiểm Bắt Buộc:</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  (store.data.choosed_car.compulsory_insurance =
                    storeMethod.formatMoney(943400))
                }}&nbsp;VNĐ
              </v-col>
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin"><h2>Tổng dự toán:</h2></v-col>
              <v-col
                cols="6"
                class="col_margin"
                style="text-align: right; color: var(--light-title-color)"
              >
                <h3>
                  {{
                    storeMethod.formatMoney(
                      (store.data.choosed_car.total_estiamte =
                        store.data.choosed_car_detail.price +
                        storeMethod.parseMoney(store.data.choosed_car.VRT) +
                        storeMethod.parseMoney(store.data.choosed_car.VRF) +
                        storeMethod.parseMoney(
                          store.data.choosed_car.material_covered
                        ) +
                        storeMethod.parseMoney(
                          store.data.choosed_car.road_fee
                        ) +
                        storeMethod.parseMoney(
                          store.data.choosed_car.vehicle_inspection
                        ) +
                        storeMethod.parseMoney(
                          store.data.choosed_car.registration_service
                        ) +
                        storeMethod.parseMoney(
                          store.data.choosed_car.compulsory_insurance
                        ))
                    )
                  }}&nbsp;VNĐ
                </h3></v-col
              >
            </v-row>
          </v-col>
        </v-row>
        <v-row v-else>
          <v-col
            >Vui lòng chọn dòng xe và nơi đăng ký để dự toán chi phí.</v-col
          >
        </v-row>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
export default {
  props: {
    have_car_type: {
      type: Boolean,
      require: false,
      default: false,
    },
  },
  data() {
    return {
      storeMethod: useStore(),
      store: storeToRefs(useStore()),
      car_version_id: null,
      car_type_id: null,
      // car_details: null,
      VRT: null,
      VRF: null,
      material_covered: null,
      road_fee: null,
      vehicle_inspection: null,
      registration_service: null,
      compulsory_insurance: null,
    };
  },
  watch: {
    car_type_id() {
      this.store.data.choosed_car = this.store.data.products.filter(
        (obj) => obj.car_id === this.car_type_id
      )[0];
      this.car_version_id = null;
      console.log("this.car_type_id", this.car_type_id);
      console.log("this.store.data.choosed_car", this.store.data.choosed_car);
    },
    car_version_id() {
      this.store.data.choosed_car_detail =
        this.store.data.choosed_car?.details?.filter(
          (obj) => obj.car_detail_id === this.car_version_id
        )[0];
      console.log(
        "this.store.data.choosed_car_detail",
        this.store.data.choosed_car_detail
      );
    },
    "store.data.choosed_car.total_estiamte"() {
      console.log(this.store.data.choosed_car.total_estiamte);
    },
  },
};
</script>

<style scoped>
.col_margin {
  margin: -15px 0;
}
</style>