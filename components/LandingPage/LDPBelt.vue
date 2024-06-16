<template>
  <v-container
    fluid
    class="d-flex justify-center align-center"
    style="background-color: var(--title-color); color: var(--background-color)"
  >
    <v-row max-width="1050px" justify="center" style="max-width: 1050px">
      <v-col cols="9" style="text-align: right">
        <span style="margin: 3vw">
          <h1>HỖ TRỢ MUA XE HONDA Ô TÔ TRẢ GÓP 85%</h1>
          <h2>LÃI SUẤT THẤP - THỦ TỤC NHANH CHÓNG</h2>
        </span>
      </v-col>
      <v-col cols="12" md="3" class="d-flex align-center justify-center">
        <v-btn
          size="x-large"
          style="
            background-color: var(--background-color);
            color: var(--title-color);
            font-weight: bold;
          "
          :color="store.style.title_color"
        >
          <v-icon>mdi-phone</v-icon>&nbsp;090 317 3345</v-btn
        >
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
    };
  },
};
</script>

<style>
</style>