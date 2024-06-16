<template>
  <v-container
    fluid
    style="background-color: var(--title-color); color: var(--background-color)"
  >
    <v-row>
      <v-col style="text-align: center">
        <h2>NHẬN TƯ VẤN NHANH</h2>
      </v-col>
    </v-row>
    <v-row justify="center">
      <v-col cols="12" md="3" style="color: white">
        <v-text-field
          v-model="custom_name"
          variant="filled"
          bg-color="white"
          color="#3d3d3d"
          label="Tên Bạn"
        >
        </v-text-field>
      </v-col>
      <v-col cols="12" md="3">
        <v-text-field
          v-model="phone"
          variant="filled"
          bg-color="white"
          color="#3d3d3d"
          label="Số Điện Thoại"
        >
        </v-text-field>
      </v-col>
      <v-col cols="12" md="3">
        <v-btn width="90%" height="70%" color="black" @click="createAdvise">
          Đăng ký
        </v-btn>
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
      storeMethod: useStore(),
      store: storeToRefs(useStore()),

      dialogSendedAdvise: false,

      custom_name: null,
      phone: null,
    };
  },
  methods: {
    async get() {
      try {
        const { results } = await $fetch("/api/submit", {
          method: "post",
          body: { test: 123 },
        });
        console.log("results", results);
        // this.store.state.user = { name: "abc" };
        console.log("user", this.store.state.user);
      } catch (error) {
        console.log("err index.vue", error);
      }
    },

    async createAdvise() {
      const tempAdvise = {
        user_id: this.store?.state?.user?.id_user
          ? this.store.state.user.id_user
          : null,
        status: "Chưa tư vấn",
        fullname: this.custom_name,
        phone: this.phone,
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

<style>
</style>