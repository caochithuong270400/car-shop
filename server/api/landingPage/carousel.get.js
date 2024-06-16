import mysql from 'mysql';
export default defineEventHandler(async () => {
    // const query = getQuery(event)
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
            connection.query("SELECT * FROM landing_carousels", (error, results) => {
                if (error) {
                    console.error("Error querying MySQL:", error);
                    reject(error);
                } else {
                    console.log("results", results);
                    result = results[0]
                    resolve(results);
                }
            });
        });
    };

    const results = await queryPromise();

    console.log('results', results);

    // Xử lý dữ liệu ở đây
    return { results };
})