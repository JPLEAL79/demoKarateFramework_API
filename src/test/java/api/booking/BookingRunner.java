package api.booking;

import com.intuit.karate.junit5.Karate;

public class BookingRunner {


    @Karate.Test
    Karate testGetBooking() {
        return Karate.run("get-booking").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPostBooking() {
        return Karate.run("post-booking").relativeTo(getClass());
    }
}
