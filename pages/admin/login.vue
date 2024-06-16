<template>
  <LoginAdmin />
</template>

<script>
import LoginAdmin from "~/components/Login.vue";
export default defineComponent({
  setup() {
    definePageMeta({
      layout: "loginadmin",
    });
  },
  components: {
    LoginAdmin,
  },
});
</script>

<style scoped>
/* CSS module không cần khai báo scoped */
</style>