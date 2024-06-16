<template>
  <v-container v-if="store.data?.products?.length > 0">
    <v-row>
      <v-col
        cols="6"
        md="4"
        v-for="(item, index) in store.data.products"
        :key="index"
      >
        <v-card
          hover
          class="mini_top_card"
          style="background-color: #8ed1fc15 !important"
          @click="choosedCar(item)"
        >
          <v-card-item>
            <v-row>
              <v-col style="text-align: center">
                <v-img :src="item?.url"></v-img>
                <v-divider dashed></v-divider>
                <b style="font-size: 18px; color: var(--primary-color)">{{
                  item.name
                }}</b>
                <br />
                <b style="color: #0f7bc0">Giá: {{ item.price }} <u>đ</u></b>
                <br />
                <b style="color: var(--title-color)">
                  Trả góp: {{ item.installment }}
                </b>
              </v-col>
            </v-row>
          </v-card-item>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
  <PBDialog />
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
import PBDialog from "../Utilities/PBDialog.vue";
export default {
  components: {
    PBDialog,
  },
  data() {
    return {
      store: storeToRefs(useStore()),
    };
  },
  methods: {
    choosedCar(item) {
      this.store.data.choosed_car = item;
      this.store.state.dialogProductDetail = true;
    },
  },
};
</script>

<style scoped>
.mini_top_card {
  margin: 0.1vw;
  padding: 2vw;
  box-shadow: 0 0 5px #0f7bc050;
}
.mini_top_card:hover {
  box-shadow: 0 0 15px #0f7bc070;
}
</style>