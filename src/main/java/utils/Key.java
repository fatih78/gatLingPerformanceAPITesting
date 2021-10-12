package utils;

public class Key {
    private static final String API_KEY = "1234";
//    When configuring it in the pipeLine as a secret
//    private static final String API_KEY = System.getenv("KEY");

    private Key() {
    }

    public static String getKey() {
        return API_KEY;
    }
}
