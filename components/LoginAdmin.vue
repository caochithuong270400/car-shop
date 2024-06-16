<template>
  <v-container class="d-flex align-center justify-center" style="height: 100vh">
    <v-card
      class="mx-auto login-card"
      prepend-icon="mdi-home"
      style="vertical-align: middle"
    >
      <template v-slot:title> Đăng nhập </template>
      <v-row class="ma-2" justify="center">
        <v-col>
          <v-text-field
            v-model="user.email"
            variant="outlined"
            label="Email"
          ></v-text-field>
        </v-col>
      </v-row>
      <v-row class="ma-2" justify="center">
        <v-col>
          <v-text-field
            v-model="user.password"
            :append-icon="show_pass1 ? 'mdi-eye' : 'mdi-eye-off'"
            :rules="[rules.required, rules.min]"
            :type="show_pass1 ? 'text' : 'password'"
            name="input-10-1"
            label="Mật khẩu"
            hint="At least 8 characters"
            variant="outlined"
            counter
            @click:append="show_pass1 = !show_pass1"
          ></v-text-field>
        </v-col>
      </v-row>
      <v-row class="ma-2" justify="center">
        <v-btn @click="checkLogin()">Đăng nhập</v-btn>
      </v-row>
    </v-card>
  </v-container>
</template>

<script>
import axios from "axios";
import { useStore } from "~/store/index.ts";
import { storeToRefs } from "pinia";
export default {
  data() {
    return {
      store: storeToRefs(useStore()),
      is_login: storeToRefs(useStore()).state._value.isLogin,

      errors: [],
      user: {
        email: null,
        password: null,
      },
      show_pass1: false,
      password: "",
      rules: {
        required: (value) => !!value || "Required.",
        min: (v) => v.length >= 8 || "Min 8 characters",
        emailMatch: () => `The email and password you entered don't match`,
      },
    };
  },
  methods: {
    async checkLogin() {
      try {
        const { results } = await $fetch("/api/account/getUser", {
          method: "post",
          body: {
            email: this.user.email,
            password: this.user.password,
          },
        });
        console.log(results);
        if (results.id_user) {
          this.store.state.user = results;
          localStorage.setItem("isLogin", true);
          localStorage.setItem("email", this.user.email);
          localStorage.setItem("password", this.user.password);
          if (results.permission === "admin") {
            this.$router.push("/admin/car");
          }
        }
      } catch (error) {
        console.log("Thông tin đăng nhập chưa khớp!", error);
      }
    },
  },
};
</script>

<style scoped>
.login-card {
  min-width: 50vw;
}
</style>