import user from '~/server/db'
import mysql from 'mysql';
export default defineEventHandler(async (event) => {

    let body = await readBody(event);
    console.log('body', body);
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
        return new Promise((resolve, reject) => {
            connection.query(`UPDATE bills set state_pay = 'Đã thanh toán' where bill_id = ${body.data.new_bill_id}`, (error, results) => {
                if (error) {
                    console.error("Error querying MySQL:", error);
                    reject(error);
                } else {
                    console.log("results", results);
                    result = results
                    resolve(results);
                }
            });
        });
    };

    const resultUpdateBillStatus = await queryPromise();

    console.log('results', resultUpdateBillStatus);

    // Xử lý dữ liệu ở đây
    return { resultUpdateBillStatus };
})