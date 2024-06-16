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
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM users where email = '${body.email}' and password = '${body.password}' order by id_user desc limit 1`, (error, results) => {
        if (error) {
          console.error("Error querying MySQL:", error);
          reject(error);
        } else {
          console.log("results", results[0]);
          result = results[0]
          resolve(results[0]);
        }
      });
    });
  };

  const results = await queryPromise();

  console.log('results', results);

  // Xử lý dữ liệu ở đây
  return { results };
})