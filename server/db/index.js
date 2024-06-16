const mysql = require('mysql');


async function getUsers() {

  // create the connection to database
  const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "car_shop",
  });
  await connection.connect((err) => {
    if (err) {
      console.error("Error connecting to MySQL:", err);
      return;
    }
    console.log("Connected to MySQL1!");
  });
  try {
    await connection.query("SELECT * FROM users", (error, results) => {
      if (error) {
        console.error("Error querying MySQL:", error);
        return error;
      }
      console.log("results", results[0]);
      return results[0];
    });
    // // execute will internally call prepare and query
    // const [results, fields] = await connection.execute(
    //   "SELECT * FROM `users`"
    // );

    // console.log(results); // results contains rows returned by server
    // console.log(fields); // fields contains extra meta data about results, if available
  } catch (err) {
    console.log("err1", err);
    return err
  }
}
module.exports = { getUsers }