
<template>
  <PBBrand />
  <PBProcedure v-if="store.data?.products[0]?.details?.length > 0" />
  <ITDBelt />
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
import ITDBelt from "~/components/Introduce/ITDBelt.vue";
import PBBrand from "~/components/PriceBoard/PBBrand.vue";
import PBProcedure from "~/components/PriceBoard/PBProcedure.vue";
// import db from "~/server/db";
export default {
  components: {
    PBBrand,
    ITDBelt,
    PBProcedure,
  },
  data() {
    return {
      store: storeToRefs(useStore()),
    };
  },
  watch: {
    "store.state.user"() {
      console.log(this.store.state.user);
    },
  },
};
</script>

<style scoped>
</style>