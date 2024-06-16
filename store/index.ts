// store/index.ts
import { defineStore } from 'pinia';
import numeral from "numeral";

// Kiểm tra nếu locale đã được đăng ký
const localeExists = (locale: string): boolean => {
  try {
    numeral.locale(locale);
    // Kiểm tra một thuộc tính của locale để xác nhận locale tồn tại
    return numeral.locales[locale] !== undefined;
  } catch {
    return false;
  }
};

// Đăng ký locale nếu chưa tồn tại
if (!localeExists('vi-custom')) {
  numeral.register('locale', 'vi-custom', {
    delimiters: {
      thousands: '.',
      decimal: ','
    },
    abbreviations: {
      thousand: 'k',
      million: 'm',
      billion: 'b',
      trillion: 't'
    },
    ordinal: (number: number): string => {
      return number === 1 ? 'er' : 'ème';
    },
    currency: {
      symbol: '₫'
    }
  });
}

// Đặt locale là 'vi-custom'
numeral.locale('vi-custom');
export const useStore = defineStore('filterStore', () => {
  const state = ref({

    // dialogProductDetail
    dialogProductDetail: false,
    model: false,
    btn_regis_theme: 'dark',
    counter: 0,
    user: {},
    isLogin: false
  })

  const style = ref({
    // button
    ldp_btn_color: '#000000',
    primary_color: '#424242',
    title_color: '#e32e2e',
    sub_background_color: '#ececec',
  })

  const data = ref({
    interests: [
      {
        period: 0,
        debt: 0,
        origin_to_pay: 0,
        interest_to_pay: 0,
      }
    ],
    products: [
      {
        car_id: null,
        name: null,
        price: null,
        details: [{}]
      }
    ],
    car_details: [
      {
        car_detail_id: null,
        car_id: null,
        version: null,
        price: null,
        is_pause: null,
        name: null,
      }
    ],
    typical: {},
    choosed_car: {
      name: null,
      car_id: null,
      // Vehicle Registration Tax
      VRT: 0,
      // Vehicle Registration Fee	
      VRF: 0,
      // bảo hiểm vật chất
      material_covered: 0,
      // phí đường bộ
      road_fee: 0,
      // đăng kiểm
      vehicle_inspection: 0,
      // dịch vụ đăng ký
      registration_service: 0,
      // bảo hiểm bắt buộc
      compulsory_insurance: 0,
      // tổng tiền
      total_estiamte: 0,
    },
    choosed_car_detail: {}
  })

  const method = ref({

  })


  async function fetchProduct() {
    console.log("aaa");
    const results = await $fetch("/api/general/product", {
      method: "get",
      // body: { test: 123 },
    });
    console.log("results", results);
    data.value.products = results;
    for (let index = 0; index < results.length; index++) {
      data.value.products[index].details = []
      if (Number(results[index]?.is_typical) === 1) {
        data.value.typical = results[index]
        console.log('typical in store', data.value.typical);

      }
    }
  }

  async function fetchCarDetails() {
    console.log("aaa");
    const results = await $fetch("/api/general/car_details", {
      method: "get",
      // body: { test: 123 },
    });

    console.log("results", results);
    if (results.length > 0) {
      for (let index = 0; index < results.length; index++) {
        if (data.value.products.length > 0) {
          const cars = data.value.products
          for (let j = 0; j < cars.length; j++) {
            if (cars[j]?.car_id === results[index]?.car_id) {
              data.value.products[j]?.details?.push(results[index])
            }
          }
        }
      }
      console.log('data.value.products[j]', data.value.products);
    }
  }

  function formatMoney(val: number) {

    return numeral(val).format("0,0");
  }

  function parseMoney(val: string) {
    return numeral(val).value();
  }

  return { state, style, data, method, fetchProduct, fetchCarDetails, formatMoney, parseMoney }
});
