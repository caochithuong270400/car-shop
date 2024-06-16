import user from '~/server/db'
import mysql from 'mysql';
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
    if (body.user.id_user) {
      return new Promise((resolve, reject) => {
        connection.query(`SELECT * FROM bills
          left join car_details on car_details.car_detail_id = bills.car_detail_id
          left join cars on cars.car_id = bills.car_id
          where user_id = '${body.user.id_user}'`, (error, results) => {
          if (error) {
            console.error("Error querying MySQL:", error);
            reject(error);
          } else {
            console.log("results", results[0]);
            result = results
            resolve(results);
          }
        });
      });
    }
  };

  const resultsBills = await queryPromise();

  console.log('results', resultsBills);

  // Xử lý dữ liệu ở đây
  return { resultsBills };
})