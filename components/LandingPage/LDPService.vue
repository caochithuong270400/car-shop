<template>
  <v-container fluid style="max-width: 1250px">
    <v-row>
      <v-col cols="12" md="4">
        <!-- <v-hover v-slot:default="{ isHovering, props }"> </v-hover> -->
        <v-card
          height="auto"
          width="auto"
          color="#8ed1fc15 !important"
          class="mini_top_card"
        >
          <v-row class="align-center">
            <v-col cols="3" md="12" style="text-align: center">
              <v-btn
                icon="mdi-circle-slice-5"
                size="x-large"
                :color="store.style.title_color"
              ></v-btn>
            </v-col>
            <v-col cols="9" md="12" class="top_card_col">
              <v-row>
                <v-col cols="12" style="text-align: center">
                  <span class="title-font">MUA XE TRẢ GÓP</span><br />
                  Mua xe trả góp tại Honda Ôtô Bình Dương, trả góp đến 85% giá
                  trị xe, lãi suất chỉ 0,6%/tháng
                </v-col>
                <v-col
                  cols="12"
                  class="d-none d-md-block"
                  style="text-align: center"
                >
                  <v-hover v-slot:default="{ isHovering, props }">
                    <v-btn
                      v-bind="props"
                      :color="
                        isHovering
                          ? store.style.title_color
                          : store.style.ldp_btn_color
                      "
                      class="ldp_btn"
                    >
                      <v-icon>mdi-arrow-right</v-icon> Chi tiết
                    </v-btn>
                  </v-hover>
                </v-col>
              </v-row>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
      <v-col cols="12" md="4">
        <!-- <v-hover v-slot:default="{ isHovering, props }"> </v-hover> -->
        <v-card
          height="auto"
          width="auto"
          color="#8ed1fc15 !important"
          class="mini_top_card"
        >
          <v-row class="align-center">
            <v-col cols="3" md="12" style="text-align: center">
              <v-btn
                icon="mdi-calculator"
                size="x-large"
                :color="store.style.title_color"
              ></v-btn>
            </v-col>
            <v-col cols="9" md="12" style="text-align: center">
              <v-row>
                <v-col cols="12" class="top_card_col">
                  <span class="title-font">TÍNH PHÍ LĂN BÁNH</span><br />
                  Giá các phiên bản xe Honda Ôtô cùng các khoản phí chi tiết tại
                  Honda Ôtô Bình Dương
                </v-col>
                <v-col
                  cols="12"
                  class="d-none d-md-block"
                  style="text-align: center"
                >
                  <v-hover v-slot:default="{ isHovering, props }">
                    <v-btn
                      v-bind="props"
                      :color="
                        isHovering
                          ? store.style.title_color
                          : store.style.ldp_btn_color
                      "
                      class="ldp_btn"
                    >
                      <v-icon>mdi-arrow-right</v-icon> Chi tiết
                    </v-btn>
                  </v-hover>
                </v-col>
              </v-row>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
      <v-col cols="12" md="4">
        <!-- <v-hover v-slot:default="{ isHovering, props }"> </v-hover> -->
        <v-card
          height="auto"
          width="auto"
          color="#8ed1fc15 !important"
          class="mini_top_card"
        >
          <v-row class="align-center">
            <v-col cols="3" md="12" style="text-align: center">
              <v-btn
                icon="mdi-car"
                size="x-large"
                :color="store.style.title_color"
              ></v-btn>
            </v-col>
            <v-col cols="9" md="12" class="top_card_col">
              <v-row>
                <v-col cols="12" style="text-align: center">
                  <span class="title-font">LÁI THỬ XE MIỄN PHÍ</span><br />
                  Đến với Honda Ôtô Bình Dương để được cảm nhận, lái thử những
                  mẫu xe Honda ôtô mới nhất
                </v-col>
                <v-col
                  cols="12"
                  class="d-none d-md-block"
                  style="text-align: center"
                >
                  <v-hover v-slot:default="{ isHovering, props }">
                    <v-btn
                      v-bind="props"
                      :color="
                        isHovering
                          ? store.style.title_color
                          : store.style.ldp_btn_color
                      "
                      class="ldp_btn"
                    >
                      <v-icon>mdi-arrow-right</v-icon> Chi tiết
                    </v-btn>
                  </v-hover>
                </v-col>
              </v-row>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
    <v-divider class="ma-4" :color="store.style.primary_color"></v-divider>
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
.mini_top_card {
  margin: 0.1vw;
  padding: 2vw;
  box-shadow: 0 0 15px #0f7bc050;
}
.mini_top_card:hover {
  box-shadow: 0 0 15px #0f7bc070;
}
.top_card_col {
  text-align: center;
  color: var(--primary-color);
}
</style>