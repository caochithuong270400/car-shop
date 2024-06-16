<template>
  <v-card v-for="(item, i) in bills" :key="i" class="bill-card">
    <v-card-title>
      <h3>{{ item.version }}</h3>
    </v-card-title>
    <v-card-text>
      <v-row>
        <v-col cols="3">
          <v-img :src="item.url"></v-img>
        </v-col>
        <v-col cols="5" style="text-align: left" class="d-flex align-center">
          <v-row>
            <v-col cols="12">
              <h4 style="color: var(--title-color)">
                Giá gốc: {{ storeMethod.formatMoney(item.price) }}đ
              </h4>
            </v-col>
            <v-col colss="12">
              <h4 style="color: var(--title-color)">
                Chi phí đặt cọc:
                {{ storeMethod.formatMoney(item.deposit_price) }}đ
              </h4>
            </v-col>
          </v-row>
        </v-col>
        <v-col cols="4" class="d-flex justify-center align-center">
          <v-row>
            <v-col cols="12" class="d-flex justify-center align-center">
              <v-card
                class="d-flex justify-center align-center"
                :style="styleStr(item.state_pay)"
                height="30px"
              >
                <b>{{ item.state_pay }}</b>
              </v-card>
            </v-col>
            <v-col
              v-if="item.state_pay === 'Chưa thanh toán'"
              cols="12"
              class="d-flex justify-center align-center"
            >
              <v-btn @click="payForBill(item)"> Thanh toán ngay </v-btn>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-card-text>
  </v-card>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
export default {
  data() {
    return {
      storeMethod: useStore(),
      store: storeToRefs(useStore()),
      bills: [],
    };
  },
  async mounted() {
    await this.fetchFirstData();
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
        }
      } catch (error) {
        console.log("Thông tin đăng nhập chưa khớp!", error);
      }
      if (this.store.state.user?.id_user) {
        try {
          const { resultsBills } = await $fetch("/api/account/getBill", {
            method: "post",
            body: {
              user: this.store.state.user,
            },
          });
          console.log("sản phẩm đã mua", resultsBills);
          if (resultsBills?.length > 0) {
            this.bills = resultsBills;
          }
        } catch (error) {
          console.log("Không lấy được dữ liệu sản phẩm!");
        }
      } else {
        this.$router.push("/login");
      }
    },
    generateRandomString(length) {
      const characters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
      let result = "";
      const charactersLength = characters.length;
      for (let i = 0; i < length; i++) {
        result += characters.charAt(
          Math.floor(Math.random() * charactersLength)
        );
      }
      return result;
    },
    styleStr(status) {
      return `background-color: ${
        status === "Đã thanh toán"
          ? "lightgreen"
          : "var(--sub-background-color)"
      } !important;
                  padding: 5px;`;
    },
    async payForBill(item) {
      try {
        if (this.store.state.user) {
          this.dialogThanhToan = false;
          this.dialogMessage = "Đặt hàng thành công";

          this.alertshow = true;

          const randomString = this.generateRandomString(8);
          const { vnPaymentResponse } = await $fetch(
            "/api/payment/create_payment_url",
            {
              method: "post",
              body: {
                order_id: `carhoangvu${this.new_bill_id}${randomString}`,
                total_amount: Math.round(Number(item.deposit_price)),
                new_bill_id: item.bill_id,
              },
            }
          );

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
        } else {
          this.dialogThanhToan = false;
          this.dialogMessage = "Đặt hàng thành công";
          this.alertshow = true;
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
.bill-card {
  margin: 3vw;
}
</style>