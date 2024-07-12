package api.auth;


import com.intuit.karate.junit5.Karate;


class AuthRunner {

    @Karate.Test
    Karate testCreateToken() {
        return Karate.run("create-token.feature").relativeTo(getClass());
    }


}



