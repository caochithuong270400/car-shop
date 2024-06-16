<template>
  <v-card variant="flat">
    <v-card-title>
      <h3 style="color: var(--title-color)">DANH SÁCH SẢN PHẨM</h3>
    </v-card-title>
    <v-card-text>
      <v-data-table
        v-model:expanded="expanded"
        :headers="dessertHeaders"
        :items="store.data.products"
        item-value="name"
        show-expand
      >
        <template v-slot:top>
          <v-row>
            <v-col style="text-align: right">
              <v-btn color="success" @click="mutationDialog = true"
                >THÊM SẢN PHẨM</v-btn
              >
            </v-col>
          </v-row>
        </template>
        <template v-slot:item.is_typical="{ item }">
          <v-checkbox
            v-if="item.is_typical === 1"
            :model-value="true"
            readonly
          ></v-checkbox>
          <v-checkbox v-else :model-value="false" readonly></v-checkbox>
        </template>
        <template v-slot:item.url="{ item }">
          <v-img :src="item.url"></v-img>
        </template>
        <template v-slot:expanded-row="{ columns, item }">
          <tr>
            <td :colspan="columns.length">
              <v-card style="margin-bottom: 5px">
                <v-card-text>
                  <v-data-table
                    v-if="item.details"
                    :headers="header_detail"
                    :items="item.details"
                    style="background-color: var(--sub-background-color)"
                  >
                    <template v-slot:item.is_pause="{ item }">
                      <v-checkbox
                        v-if="item.is_pause === 1"
                        :model-value="true"
                        readonly
                      ></v-checkbox>
                      <v-checkbox
                        v-else
                        :model-value="false"
                        readonly
                      ></v-checkbox>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </td>
          </tr>
        </template>
      </v-data-table>
    </v-card-text>
  </v-card>
  <v-dialog v-model="mutationDialog">
    <v-card>
      <v-card-title>
        <h3>THÊM SẢN PHẨM</h3>
      </v-card-title>
      <v-card-text>
        <v-row>
          <v-col cols="12">
            <v-text-field label="Url hình ảnh"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-text-field label="Tên xe"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-text-field label="Giá trị trả góp"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-text-field label="Ngày nhập kho"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-checkbox label="Là đại diện"></v-checkbox>
          </v-col>
        </v-row>
      </v-card-text>
      <v-card-actions>
        <v-btn @click="mutationDialog = false">ĐÓNG</v-btn>
        <v-btn @click="mutationDialog = false">LƯU</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
  <!-- <v-dialog v-model="dialog">
    <v-card>
      <v-card-title>
        Xác nhận lưu sản phẩm?
      </v-card-title>
      <v-card-actions>
        <v-btn>ĐÓNG</v-btn>
        <v-btn>XÁC NHẬN</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog> -->
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
export default defineComponent({
  setup() {
    definePageMeta({
      layout: "admin",
    });
  },
  data() {
    return {
      storeMethod: useStore(),
      store: storeToRefs(useStore()),

      mutationDialog: false,

      expanded: [],
      dessertHeaders: [
        {
          title: "Hình ảnh",
          align: "start",
          sortable: false,
          key: "url",
        },
        { title: "Tên xe", key: "name" },
        { title: "Trả góp", key: "installment" },
        { title: "Ngày nhập kho", key: "importdate" },
        { title: "Đại diện", key: "is_typical" },
      ],
      header_detail: [
        {
          title: "Phiên bản",
          align: "start",
          sortable: false,
          key: "version",
        },
        { title: "Giá", key: "price" },
        { title: "Tạm ngưng", key: "is_pause" },
      ],
      desserts: [
        {
          name: "Frozen Yogurt",
          calories: 159,
          fat: 6.0,
          carbs: 24,
          protein: 4.0,
          iron: 1,
        },
        {
          name: "Ice cream sandwich",
          calories: 237,
          fat: 9.0,
          carbs: 37,
          protein: 4.3,
          iron: 1,
        },
        {
          name: "Eclair",
          calories: 262,
          fat: 16.0,
          carbs: 23,
          protein: 6.0,
          iron: 7,
        },
        {
          name: "Cupcake",
          calories: 305,
          fat: 3.7,
          carbs: 67,
          protein: 4.3,
          iron: 8,
        },
        {
          name: "Gingerbread",
          calories: 356,
          fat: 16.0,
          carbs: 49,
          protein: 3.9,
          iron: 16,
        },
        {
          name: "Jelly bean",
          calories: 375,
          fat: 0.0,
          carbs: 94,
          protein: 0.0,
          iron: 0,
        },
        {
          name: "Lollipop",
          calories: 392,
          fat: 0.2,
          carbs: 98,
          protein: 0,
          iron: 2,
        },
        {
          name: "Honeycomb",
          calories: 408,
          fat: 3.2,
          carbs: 87,
          protein: 6.5,
          iron: 45,
        },
        {
          name: "Donut",
          calories: 452,
          fat: 25.0,
          carbs: 51,
          protein: 4.9,
          iron: 22,
        },
        {
          name: "KitKat",
          calories: 518,
          fat: 26.0,
          carbs: 65,
          protein: 7,
          iron: 6,
        },
      ],
    };
  },
  mounted() {
    this.fetchFirstData();
  },
  methods: {
    fetchFirstData() {
      //   try {
      //     if()
      //   } catch (error) {
      //     console.log("Lỗi lấy thông tin xe", error);
      //   }
    },
  },
});
</script>

<style>
</style>