<template>
  <v-container fluid style="background-color: var(--title-color)">
    <v-row>
      <v-col cols="6">
        <v-img
          src="https://otohondabinhduong5s.net/wp-content/uploads/2023/05/honda-civic-type-r-10.jpg"
        ></v-img>
      </v-col>
      <v-col cols="12" md="6" class="quote_font">
        <h1>NHẬN BÁO GIÁ & ĐĂNG KÍ LÁI THỬ</h1>
        <v-row>
          <v-col
            cols="12"
            style="color: white"
            class="d-flex align-center justify-center"
          >
            <v-text-field
              v-model="custom_name"
              variant="outlined"
              bg-color="white"
              color="#3d3d3d"
              label="Tên Bạn"
              max-width="60%"
            >
            </v-text-field>
          </v-col>
          <v-col cols="12" class="d-flex align-center justify-center">
            <v-text-field
              v-model="phone"
              variant="outlined"
              bg-color="white"
              color="#3d3d3d"
              label="Số Điện Thoại"
              max-width="60%"
            >
            </v-text-field>
          </v-col>
          <v-col cols="12" class="d-flex align-center justify-center">
            <v-autocomplete
              v-model="car_id"
              :items="store.data.products"
              variant="outlined"
              bg-color="white"
              color="#3d3d3d"
              label="Dòng Xe Quan Tâm"
              item-title="name"
              item-value="car_id"
              max-width="60%"
            >
            </v-autocomplete>
          </v-col>
          <v-col cols="12">
            <v-btn max-width="60%" color="black" @click="createAdvise()">
              Đăng ký
            </v-btn>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
    <v-dialog v-model="dialogSendedAdvise" width="auto">
      <v-card>
        <v-card-text>
          <h3 style="text-align: center">
            Cảm ơn bạn đã quan tâm! Chúng tôi sẽ liên hệ với bạn sớm nhất có
            thể!
          </h3>
        </v-card-text>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
export default {
  data() {
    return {
      dialogSendedAdvise: false,
      storeMethod: storeToRefs(useStore()),
      store: useStore(),
      custom_name: null,
      phone: null,
      car_id: null,
    };
  },
  methods: {
    async createAdvise() {
      const tempAdvise = {
        user_id: this.store?.state?.user?.id_user
          ? this.store.state.user.id_user
          : null,
        status: "Chưa tư vấn",
        fullname: this.custom_name,
        phone: this.phone,
        car_id: this.car_id,
      };
      const { results } = await $fetch("/api/payment/create_advise", {
        method: "post",
        body: {
          advise: tempAdvise,
        },
      });
      console.log("kết quả insert phiếu tư vấn", results);
      if (Number(results.affectedRows) > 0) {
        this.dialogSendedAdvise = true;
      }
    },
  },
};
</script>

<style scoped>
.quote_font {
  text-align: center;
  color: var(--background-color);
}
</style>