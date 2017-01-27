import java.sql.Connection;
import java.sql.DriverManager;

public class TestConnection {

	public static void main(String[] args) {

		String host = args[0];
		String user = args[1];
		String password = args[2];
		String port = args[3];
		String dbname = args[4];
		String url = "jdbc:postgresql://" + host + ":" + port + "/" + dbname;

		Connection conn = null;
		while (true) {
			try {
				Class clazz = Class.forName("org.postgresql.Driver");
				conn = DriverManager.getConnection(url, user, password);
			} catch (Exception e) {
				System.err.println("Connection to '"+url+"' failed - "+e.getMessage());
			} finally {
				try {
					if (conn != null) {
						conn.close();
						break;
					}
				} catch (Exception e) {
				}
				try {
					Thread.currentThread().sleep(3000);
				} catch (Exception e) {
				}
			}
		}
		
		System.err.println("Success! '"+url+"' connected");
	}
}
