<template>
  <v-container v-if="store.data.typical?.url">
    <v-row>
      <v-col style="text-align: center">
        <span class="header-title">DÒNG XE TIÊU BIỂU TẠI</span><br />
        <span class="title-font" style="font-size: 30px"
          >Honda Ôtô Bình Dương</span
        >
      </v-col>
    </v-row>
    <v-row>
      <v-col class="d-flex align-center justify-center" style="padding: 0 16vw">
        <v-img cover no-repeat :src="store.data.typical?.url" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
export default {
  data() {
    return {
      store: storeToRefs(useStore()),
      product: [],
    };
  },
  async mounted() {
    // await this.fetch();
  },
  watch: {
    // "store.data.products"() {
    //   console.log("in typical", this.store.data.products);
    // },
  },
  methods: {},
};
</script>

<style scoped>
</style>