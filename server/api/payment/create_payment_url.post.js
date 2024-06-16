import user from '~/server/db'
import mysql from 'mysql';
import VNPay from "node-vnpay";
export default defineEventHandler(async (event) => {

    let body = await readBody(event);
    let result = null
    const connection = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "car_shop",
    });

    // Tạo một promise để kết nối đến MySQL
    const connectPromise = () => {
        return new Promise((resolve, reject) => {
            connection.connect((err) => {
                if (err) {
                    console.error("Error connecting to MySQL:", err);
                    reject(err);
                } else {
                    console.log("Connected to MySQL!");
                    resolve();
                }
            });
        });
    };

    await connectPromise();

    // Tạo một promise để thực hiện truy vấn
    const queryPromise = () => {
        return new Promise(async (resolve, reject) => {
            let vnpay = new VNPay({
                secretKey: "WCHFPSNIQRTWKNGLDMXZAHOVRJYAJSQU",
                returnUrl: `http://localhost:5000/pay_status?new_bill_id=${body.new_bill_id}`,
                merchantCode: "W78VA83D",

                hashAlgorithm: "md5", // optional
            });

            try {
                const { order_id, total_amount } = body;
                let payURL = await vnpay.genPayURL({
                    transactionRef: order_id.toString(),//Date.now() + '_' + Math.floor(Math.random() * 10000),
                    orderInfo: "Thanh toan dat coc xe oto",
                    orderType: "100000",
                    amount: total_amount,
                    bankCode: "NCB",
                });

                console.log('payURL', payURL);

                // Chuyển hướng người dùng đến payURL
                resolve({ payURL: payURL });
            } catch (error) {
                console.error("Error:", error);
                reject(error);
            }
        });
    };

    const vnPaymentResponse = await queryPromise();

    console.log('results', vnPaymentResponse);

    // Xử lý dữ liệu ở đây
    return { vnPaymentResponse };
})