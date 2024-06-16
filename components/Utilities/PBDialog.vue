<template>
  <v-dialog
    v-model="store.state.dialogProductDetail"
    transition="dialog-bottom-transition"
    fullscreen
  >
    <v-card>
      <v-toolbar>
        <v-btn
          icon="mdi-close"
          @click="store.state.dialogProductDetail = false"
        ></v-btn>

        <v-toolbar-title>Settings</v-toolbar-title>

        <v-spacer></v-spacer>

        <v-toolbar-items>
          <v-btn text="Save" variant="text" @click="closeDialog"></v-btn>
        </v-toolbar-items>
      </v-toolbar>
      <PBCarInfo />
    </v-card>
  </v-dialog>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
import PBCarInfo from "../PriceBoard/PBCarInfo.vue";
export default {
  components: {
    PBCarInfo,
  },
  data() {
    return {
      store: storeToRefs(useStore()),
    };
  },
  watch: {},
  methods: {
    closeDialog() {
      this.store.state.dialogProductDetail = false;
    },
  },
};
</script>

<style>
</style>