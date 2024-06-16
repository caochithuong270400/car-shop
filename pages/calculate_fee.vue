<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="6">
        <CalculateRollingFee />
      </v-col>
      <v-col cols="12" md="6">
        <CalculateInstallmentInterest />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import CalculateInstallmentInterest from "~/components/Utilities/CalculateInstallmentInterest.vue";
import CalculateRollingFee from "~/components/Utilities/CalculateRollingFee.vue";
export default {
  components: {
    CalculateRollingFee,
    CalculateInstallmentInterest,
  },
};
</script>

<style>
</style>