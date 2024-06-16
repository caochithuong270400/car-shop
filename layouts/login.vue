<template>
  <main class="login-background">
    <slot />
  </main>
</template>

<script>
import { useStore } from "~/store";
import { storeToRefs } from "pinia";
export default {
  data() {
    return {
      store: storeToRefs(useStore()),
    };
  },
  async mounted() {
    await this.fetchFirstData();
    // if (this.store.state.isLogin === true) {
    //   console.log("Đã đăng nhập trước đó!");
    //   this.$router.push("/");
    // } else {
    //   console.log("chưa đăng nhập");
    // }
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
      if (this.store.state.user.id_user) {
        this.$router.push("/");
      } else {
        console.log("chưa đăng nhập");
      }
    },
  },
};
</script>

<style scoped>
.login-background {
  background-image: url("https://firebasestorage.googleapis.com/v0/b/tfbvn-3755f.appspot.com/o/app_icon%2Fcompany-examination-admin-web%2Fbackground_login.jpg?alt=media&token=45d9c2a5-7e7c-4d11-99a0-2650022a125d&_gl=1*iuh49d*_ga*Mzg2MTcyNzg1LjE2OTkyNDIxMzc.*_ga_CW55HF8NVT*MTY5OTI0MjEzNi4xLjEuMTY5OTI0MjIxMy41My4wLjA.");
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  height: 100%;
  width: 100%;
}
</style>