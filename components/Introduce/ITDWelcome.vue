<template>
  <v-container fluid style="text-align: left; padding: 3vw 5vw">
    <v-row class="pa-4">
      <v-col cols="12" md="6" style="color: var(--primary-color)">
        <span style="text-align: center">
          <h3 class="title-text">CHÀO MỪNG ĐẾN VỚI</h3>
          <h2>HONDA ÔTÔ BÌNH DƯƠNG</h2>
        </span>
        <span>
          Công ty TNHH Thương Mại Dịch Vụ Ô tô Hòa Bình Minh được thành lập ngày
          17 Tháng 09 Năm 2014, tại địa chỉ Khu Phố Bình Đức 2, Phường Bình Hòa,
          Thị xã Thuận An, tỉnh Bình Dương, là công ty thành viên của Tổng Công
          Ty Hòa Bình Minh được thành lập từ năm 1993, kinh doanh đa ngành nghề
          với định hướng là “Kinh doanh – Tích luỹ – Tăng năng lực – Mở rộng,
          phát triển”, có trụ sở chính tại: Tổ 9A – Phường Nguyễn Thái Học –
          Thành phố Yên Bái – Tỉnh Yên Bái.
        </span>
      </v-col>
      <v-col cols="12" md="6" style="text-align: center">
        <v-img
          src="https://otohondabinhduong5s.net/wp-content/uploads/2023/08/honda-oto-binh-duong-1-1.jpg"
        ></v-img>
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

<style scoped>
.title-text {
  color: var(--title-color);
}
</style>