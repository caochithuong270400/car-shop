<template>
  <v-container>
    <v-row v-for="(item, index) in store.data.products" :key="index">
      <v-col cols="12" md="3" class="d-flex align-center">
        <v-row>
          <v-col cols="12">
            <v-img :src="item?.url"></v-img>
          </v-col>
          <v-col cols="12" class="d-flex align-center justify-center">
            <span style="color: var(--title-color); font-weight: bold">
              {{ item.name }}
            </span>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="12" md="6">
        <v-data-table
          :headers="headers"
          :items="item.details"
          density="compact"
          hide-footer
        >
          <template v-slot:item.price="{ item }"> {{ item.price }} đ </template>
        </v-data-table>
      </v-col>
      <v-col cols="12" md="3" class="d-flex align-center">
        <v-btn
          color="var(--title-color)"
          style="color: var(--background-color); font-weight: bold"
          @click="
            store.data.choosed_car = item;
            console.log(store.data.choosed_car);
            store.state.dialogProductDetail = true;
          "
        >
          <v-icon>mdi-calculator</v-icon>Xem Chi Tiết
        </v-btn>
      </v-col>
      <v-col>
        <v-divider></v-divider>
      </v-col>
    </v-row>
    <PBDialog />
  </v-container>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
import PBDialog from "../Utilities/PBDialog.vue";
export default {
  components: { PBDialog },
  data() {
    return {
      store: storeToRefs(useStore()),
      headers: [
        { title: "Phiên Bản", align: "start", key: "version" },
        { title: "Giá", align: "end", key: "price" },
      ],
    };
  },
};
</script>

<style>
</style>