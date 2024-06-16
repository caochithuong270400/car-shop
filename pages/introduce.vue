
<template>
  <ITDBrand />
  <ITDWelcome />
  <ITDInfrastructure />
  <ITDBelt />
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
import ITDBrand from "~/components/Introduce/ITDBrand.vue";
import ITDWelcome from "~/components/Introduce/ITDWelcome.vue";
import ITDInfrastructure from "~/components/Introduce/ITDInfrastructure.vue";
import ITDBelt from "~/components/Introduce/ITDBelt.vue";
// import db from "~/server/db";
export default {
  components: {
    ITDBrand,
    ITDWelcome,
    ITDInfrastructure,
    ITDBelt,
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