<template>
  <v-container fluid style="background-color: var(--background-color)">
    <v-row>
      <v-col cols="12" md="6">
        <v-row>
          <v-col cols="12" class="d-flex align-center justify-center">
            <v-img :src="store.data.choosed_car?.url" max-width="50%"></v-img>
          </v-col>
          <v-col cols="12" class="title-font" style="text-align: center">
            GIÁ BÁN:
            {{ storeMethod.formatMoney(store.data.choosed_car?.price) }} Đ
          </v-col>
          <v-col cols="12" v-if="store.data.choosed_car?.details?.length > 0">
            <v-data-table
              :headers="headers"
              :items="store.data.choosed_car.details"
              density="compact"
              hide-footer
            >
              <template v-slot:item.price="{ item }">
                {{ storeMethod.formatMoney(item.price) }} đ
              </template>
            </v-data-table>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="12" md="6">
        <v-card style="border: 2px dashed var(--title-color)">
          <v-card-text>
            <v-row>
              <v-col cols="12" style="text-align: center">
                <span style="font-size: 18px; color: var(--primary-color)"
                  >KHUYẾN MÃI MUA XE</span
                ><br />
                <h2 class="title-font">HONDA BR-V</h2>
              </v-col>
              <v-col cols="12"><div v-html="cleanHtml()"></div></v-col>
              <v-col cols="12" class="d-flex justify-center">
                <v-btn color="primary"
                  ><v-icon>mdi-circle-edit-outline</v-icon>&nbsp;Nhận báo giá
                  ngay</v-btn
                >
              </v-col>
            </v-row>
            <br />
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-divider class="ma-6"></v-divider>
    <h2 style="color: var(--title-color)">
      Giá Lăn Bánh {{ store.data.choosed_car?.name }}
    </h2>
    <v-container>
      <v-row>
        <v-col cols="12" md="6">
          <CalculateRollingFee :have_car_type="true" />
        </v-col>
        <v-col cols="12" md="6">
          <CalculateInstallmentInterest />
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" class="d-flex justify-center">
          <v-btn color="red" @click="fetchFirstData">
            <v-icon>mdi-circle-edit-outline</v-icon>&nbsp;Đặt cọc ngay</v-btn
          >
        </v-col>
      </v-row>
    </v-container>
  </v-container>

  <v-dialog
    v-model="dialogThanhToan"
    v-if="!isLoggedIn"
    persistent
    max-width="600px"
  >
    <v-card max-height="80vh">
      <v-card-title>
        <span class="text-h5">Thông tin nhận hàng</span>
      </v-card-title>
      <v-card-text>
        <v-card>
          <v-card-text style="max-height: 60vh; overflow-y: auto">
            <v-row>
              <v-col cols="12">
                <v-text-field
                  label="Họ và tên*"
                  v-model="store.state.user.fullname"
                  required
                  readonly
                  prepend-icon="mdi-rename-box"
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  label="Địa chỉ email"
                  v-model="store.state.user.email"
                  readonly
                  suffix="@"
                  prepend-icon="mdi-email-outline"
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  label="Số điện thoại"
                  v-model="store.state.user.phone"
                  readonly
                  type="number"
                  prepend-icon="mdi-phone"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  label="Địa chỉ"
                  v-model="store.state.user.address"
                  readonly
                  prepend-icon="mdi-map-marker"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-select
                  :items="[
                    'Thanh toán khi nhận hàng',
                    'Chuyển khoản ngân hàng',
                  ]"
                  label="Hình thức thanh toán"
                  v-model="paymentMethod"
                  required
                  @change="showBankAccount"
                ></v-select>
              </v-col>

              <v-col cols="6">
                <h2>Tổng dự toán:</h2>
              </v-col>
              <v-col
                cols="6"
                style="text-align: right; color: var(--light-title-color)"
              >
                <h3>
                  {{
                    storeMethod.formatMoney(
                      store.data.choosed_car.total_estiamte * 0.1
                    )
                  }}
                  đ
                </h3>
              </v-col>
              <v-col v-if="bankAccount">
                <h3>VietinBank: {{ bankAccount }}</h3>
                <h3>Nội dung: Họ tên trên thông tin nhận hàng</h3>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="green darken-1" text @click="dialogThanhToan = false">
          Close
        </v-btn>
        <v-btn color="green darken-1" text @click="saveCustomerInfo">
          Save
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
import DOMPurify from "dompurify";
import CalculateRollingFee from "../Utilities/CalculateRollingFee.vue";
import CalculateInstallmentInterest from "../Utilities/CalculateInstallmentInterest.vue";
export default {
  components: {
    CalculateRollingFee,
    CalculateInstallmentInterest,
  },
  data() {
    return {
      storeMethod: useStore(),
      store: storeToRefs(useStore()),
      paymentMethod: "",
      dialogThanhToan: false,
      bankAccount: "",
      html_css: `<span style="font-size: 15px">&bull;&nbsp;<span class="highlight-text">
      Có Xe Sẵn, Đủ Màu, Đủ Phiên Bản, Giao ngay
      </span><br />
      &bull;&nbsp;<span class="highlight-text">
      Giảm ngay GÓI 66 triệu Bao gồm tiền mặt và phụ kiện
      </span><br />
      &bull;&nbsp;<span class="highlight-text">
      Tặng gói Phụ Kiện Chính Hãng Honda
      </span><br />
      &bull;&nbsp;<span class="highlight-text">
      Tặng gói bảo dưỡng miễn phí 1000km
      </span><br />
      &bull;&nbsp;<span class="common-text">
      Tư vấn, hỗ trợ lắp đặt phụ kiện chính hãng như: 
      Dán film cách nhiệt, phủ ceramic, trải sàn, trải cốp, 
      vá lốp, dù honda, sổ da, xăng xe.....v.v
      </span><br />
      &bull;&nbsp;<span class="common-text">
      Tư vấn tham gia bảo hiểm thân xe hai chiều chính hãng
       Honda để đảm bảo đầy đủ quyền lợi cho Quý khách
      </span><br />
      &bull;&nbsp;<span class="common-text">
      Bảo hành 3 năm hoặc 100,000 Km, Mở Rộng Bảo Hành
      </span><br />
      &bull;&nbsp;<span class="common-text">
      Chỉ thanh toán trước <span style="font-weight: bold">
      khoảng 100 triệu nhận xe ngay</span>
      &bull;&nbsp;<span class="common-text">
      Đặc biệt không bán xe kèm lạc
      </span><br />
      &bull;&nbsp;<span class="common-text">
      Tư vấn mua xe nhiệt tình
      </span><br />
      &bull;&nbsp;<span class="common-text">
      Hỗ trợ lái thử tận nhà
      </span><br />
      &bull;&nbsp;<span class="highlight-text">
      Hỗ trợ mua xe trả góp 85%, thủ tục nhanh gọn, 
      lãi suất thấp, bao duyệt vay nợ xấu
      </span><br />
      &bull;&nbsp;<span class="common-text">
      Còn rất nhiều phần quà tặng hấp dẫn khác, 
      ưu đãi đặc biệt khi khách hàng gọi điện đặt hẹn trước 
      khi đến đại lý mua xe.
      </span><br /></span>`,

      headers: [
        { title: "Phiên Bản", align: "start", key: "version" },
        { title: "Giá", align: "end", key: "price" },
      ],
      new_bill_id: null,
    };
  },
  mounted() {
    console.log("abc");
  },
  methods: {
    async fetchFirstData() {
      try {
        const { results } = await $fetch("/api/account/getUser", {
          method: "post",
          body: {
            email: localStorage.getItem("email"),
            password: localStorage.getItem("password"),
          },
        });
        console.log(results);
        if (results.id_user) {
          this.store.state.user = results;
          this.dialogThanhToan = true;
        }
      } catch (error) {
        console.log("Thông tin đăng nhập chưa khớp!", error);
      }
      if (!this.store.state.user.id_user) {
        this.$router.push("/login");
        return false;
      }
      return true;
    },
    cleanHtml() {
      return DOMPurify.sanitize(
        this.store.data.choosed_car?.car_purchase_promotion
      );
    },

    showBankAccount() {
      if (this.paymentMethod === "Chuyển khoản ngân hàng") {
        this.bankAccount = "0123456789"; // Thay thế chuỗi này bằng số tài khoản thực tế
      } else {
        this.bankAccount = ""; // Đặt lại giá trị khi không chọn hình thức chuyển khoản
      }
    },
    async saveBill() {
      const { results } = await $fetch("/api/payment/create_bill", {
        method: "post",
        body: {
          user: this.store.state.user,
          choosed_car_detail: this.store.data.choosed_car_detail,
          choosed_car: this.store.data.choosed_car,
          estimate_price:
            this.storeMethod.parseMoney(
              this.store.data.choosed_car.total_estiamte
            ) * 0.1,
          transfer_method: this.paymentMethod,
          pay_state: "Chưa thanh toán",
        },
      });
      console.log("results save bill", results);
      if (results.insertId) {
        this.new_bill_id = results.insertId;
        return true;
      } else {
        return false;
      }
    },
    async saveCustomerInfo() {
      try {
        if (await this.saveBill()) {
          if (
            this.paymentMethod === "Chuyển khoản ngân hàng" &&
            this.store.state.user &&
            this.store.data.choosed_car_detail
          ) {
            // const { response } = await $fetch("/api/account/addcustomer", {
            //   method: "post",
            //   body: {
            //     user: this.store.state.user,
            //     validateStatus: false,
            //   },
            // });

            // if (response.status === 200) {
            // const { order_id, total_amount } = response.data;
            this.dialogThanhToan = false;
            this.dialogMessage = "Đặt hàng thành công";

            this.alertshow = true;

            const { vnPaymentResponse } = await $fetch(
              "/api/payment/create_payment_url",
              {
                method: "post",
                body: {
                  order_id: `carhoangvu${this.new_bill_id}`,
                  total_amount: Math.round(
                    this.storeMethod.parseMoney(
                      this.store.data.choosed_car.total_estiamte
                    ) * 0.1
                  ),
                  new_bill_id: this.new_bill_id,
                },
              }
            );
            // const vnPaymentResponse = await this.$axios.post(
            //   "http://localhost:3001/create_payment_url",
            //   { order_id, total_amount }
            // );

            if (vnPaymentResponse) {
              const payURL = vnPaymentResponse.payURL;
              if (payURL) {
                const newTab = window.open(payURL, "_blank");
                if (!newTab) {
                  console.error("Không thể mở tab mới.");
                }
              } else {
                console.error("Không nhận được payURL từ server.");
              }
            }
            // } else {
            //   const errorMessage = response.data.error;
            //   this.dialogMessage = errorMessage;
            //   this.alertshow = true;

            //   return;
            // }
          } else {
            // Xử lý khi không chọn hình thức thanh toán 'Chuyển khoản ngân hàng'
            // const response = await this.$axios.post(
            //   "http://localhost:3001/addcustomer",
            //   this.customerInfo,
            //   { validateStatus: false }
            // );

            // if (response.status === 200) {
            this.dialogThanhToan = false;
            this.dialogMessage = "Đặt hàng thành công";
            // await this.$store.dispatch("cart/clearCart");
            this.alertshow = true;
            // } else {
            //   const errorMessage = response.data.error;
            //   this.dialogMessage = errorMessage;
            //   this.alertshow = true;

            //   return;
            // }
          }
        }
      } catch (error) {
        console.error("Error saving customer info:", error);
        // Xử lý lỗi nếu cần
      }
    },
  },
};
</script>

<style scoped>
.highlight_text {
  color: var(--title-color);
  font-weight: bold;
}
</style>