<template>
  <v-container>
    <v-card>
      <v-card-title style="color: var(--light-title-color)"
        >TÍNH LÃI TRẢ GÓP</v-card-title
      >
      <v-divider></v-divider>
      <v-card-text>
        <v-row>
          <v-col cols="12">
            <v-autocomplete
              v-model="borrow.borrow_percent"
              :items="list_percent"
              item-title="title"
              item-value="value"
              label="Số tiền vay"
            >
            </v-autocomplete>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12">
            <v-text-field
              v-model="borrow.borrow_year"
              label="Thời gian vay"
              suffix="Năm"
            ></v-text-field>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12">
            <v-text-field
              v-model="borrow.borrow_interest"
              label="Lãi suất vay"
              type="number"
              suffix="%/năm"
              width="100%"
            ></v-text-field>
          </v-col> </v-row
        ><v-row>
          <v-col cols="12">
            <v-autocomplete
              v-model="borrow.borrow_type_id"
              :items="list_borrow_type"
              item-title="title"
              item-value="value"
              label="Loại hình vay"
            >
            </v-autocomplete>
          </v-col>
        </v-row>
        <v-row v-if="display_calculate">
          <v-col>
            <v-row style="margin: 0 5%">
              <v-col cols="6" class="col_margin">Số tiền vay:</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  storeMethod.formatMoney(
                    (store.data.choosed_car.total_estiamte *
                      borrow.borrow_percent) /
                      100
                  )
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col
                v-if="borrow.borrow_type_id === 2"
                cols="6"
                class="col_margin"
                >Số tiền hàng tháng phải trả:</v-col
              >
              <v-col
                v-if="borrow.borrow_type_id === 2"
                cols="6"
                class="col_margin"
                style="text-align: right"
              >
                {{}}&nbsp;VNĐ</v-col
              >
              <v-col v-if="borrow.borrow_type_id === 2" cols="12"
                ><v-divider></v-divider
              ></v-col>

              <v-col cols="6" class="col_margin"
                >Tổng số tiền lãi phải trả:</v-col
              >
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{
                  (VRF = storeMethod.formatMoney(this.sum_interest_pay))
                }}&nbsp;VNĐ</v-col
              >
              <v-col cols="12"><v-divider></v-divider></v-col>
              <v-col cols="6" class="col_margin">Tổng số tiền phải trả:</v-col>
              <v-col cols="6" class="col_margin" style="text-align: right">
                {{ storeMethod.formatMoney(this.sum_debt_pay) }}&nbsp;VNĐ</v-col
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
      car_details: null,
      VRT: null,
      VRF: null,
      material_covered: null,
      road_fee: null,
      vehicle_inspection: null,
      registration_service: null,
      compulsory_insurance: null,
      display_calculate: false,
      loan: 0,
      sum_debt_pay: 0,
      sum_interest_pay: 0,

      borrow: {
        borrow_percent: 0,
        borrow_year: 5,
        borrow_interest: 7,
        borrow_type_id: 1,
      },

      list_monthly_interest: [
        {
          // số thứ tự kỳ trả
          period_num: 1,
          // dư nợ đầu kỳ
          period_outstanding: null,
          // tiền gốc phải trả
          principal_payable: null,
          // lãi phải trả
          interest_payable: null,
          // gốc + lãi
          princible_interest: null,
        },
      ],
      list_borrow_type: [
        {
          title: "Trả lãi theo dư nợ giảm dần",
          value: 1,
        },
        {
          title: "Trả lãi chia đều",
          value: 2,
        },
      ],

      list_percent: [
        {
          title: "0 %",
          value: 0,
        },
        {
          title: "10 %",
          value: 10,
        },
        {
          title: "20 %",
          value: 20,
        },
        {
          title: "30 %",
          value: 30,
        },
        {
          title: "40 %",
          value: 40,
        },
        {
          title: "50 %",
          value: 50,
        },
        {
          title: "60 %",
          value: 60,
        },
        {
          title: "70 %",
          value: 70,
        },
        {
          title: "80 %",
          value: 80,
        },
      ],
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
      this.car_details = this.store.data.choosed_car?.details?.filter(
        (obj) => obj.car_detail_id === this.car_version_id
      )[0];
      console.log("this.car_version_id", this.car_version_id);
      console.log("this.car_details", this.car_details);
    },
    "borrow.borrow_percent": "watchBorrow",
    "borrow.borrow_year": "watchBorrow",
    "borrow.borrow_interest": "watchBorrow",
    "borrow.borrow_type_id": "watchBorrow",
    "store.data.choosed_car.total_estiamte": "watchBorrow",
  },
  methods: {
    watchBorrow() {
      if (
        this.store.data.choosed_car?.total_estiamte &&
        this.borrow.borrow_percent &&
        this.borrow.borrow_year &&
        this.borrow.borrow_interest &&
        this.borrow.borrow_type_id
      ) {
        this.interestCalculate();
        this.display_calculate = true;
      } else {
        this.display_calculate = false;
      }
    },
    resetInterest() {
      this.store.data.interests = [];
      this.sum_interest_pay = 0;
    },
    interestCalculate() {
      if (
        this.store.data.choosed_car?.total_estiamte &&
        this.borrow &&
        Number(this.borrow.borrow_percent) > 0 &&
        Number(this.borrow.borrow_year) > 0 &&
        Number(this.borrow.borrow_interest) > 0 &&
        this.borrow.borrow_type_id
      ) {
        this.loan = Math.round(
          Number(this.store.data.choosed_car.total_estiamte) *
            (Number(this.borrow.borrow_percent) / 100)
        );
        let tempLoan = this.loan;
        this.resetInterest();
        const interest_rate_month = this.borrow.borrow_interest / 12;
        for (
          let index = 0;
          index < Number(this.borrow.borrow_year) * 12;
          index++
        ) {
          const tempInterest = {
            period: 0,
            debt: 0,
            origin_to_pay: 0,
            interest_to_pay: 0,
          };
          tempInterest.period = index + 1;
          tempInterest.debt = tempLoan;
          tempInterest.origin_to_pay = Math.round(
            this.loan / (Number(this.borrow.borrow_year) * 12)
          );
          tempInterest.interest_to_pay = Math.round(
            tempLoan * (Number(interest_rate_month) / 100)
          );
          tempLoan = tempLoan - tempInterest.origin_to_pay;
          this.sum_interest_pay += tempInterest.interest_to_pay;
          this.store.data.interests.push(tempInterest);
        }
        console.log("this.store.data.interests", this.store.data.interests);
        this.sum_debt_pay = Number(this.loan) + this.sum_interest_pay;
        console.log("Number(this.loan)", Number(this.loan));
        console.log("this.sum_interest_pay", this.sum_interest_pay);
      }
    },
  },
};
</script>

<style scoped>
.col_margin {
  margin: -15px 0;
}
</style>