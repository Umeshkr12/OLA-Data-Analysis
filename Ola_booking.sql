create database Ola;
use Ola;
select * from ola_booking;


--  1. Retrieve all successful bookings:
create view successfull_booking as
select * from ola_booking
where Booking_Status="success";

select * from successfull_booking;

--  2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select Vehicle_Type,avg(Ride_Distance) average_distance
 from ola_booking
    group by Vehicle_Type;
    
select * from ride_distance_for_each_vehicle;

--  3. Get the total number of cancelled rides by customers:
create view cancelled_ride_by_customers as
select count(*) from ola_booking
where Booking_Status = 'Canceled by Customer';

select * from cancelled_ride_by_customers;

--  4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID , count(booking_id) total_ride from ola_booking
group by Customer_ID
order by  total_ride desc 
limit 5;

select * from top_5_customers;

--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_ride_by_drivers_P_C as
select count(*) from ola_booking
where Canceled_Rides_by_Driver = 'Personal & Car related issue' ;

select * from cancelled_ride_by_drivers_p_c;


--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating as
select max(Driver_Ratings) max_rating,min(Driver_Ratings) min_rating from ola_booking
where Vehicle_Type = "prime sedan";

select * from max_min_driver_rating;

--  7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as 
select * from ola_booking
where Payment_Method = "UPI";

select * from upi_payment; 

--  8. Find the average customer rating per vehicle type:
create view AVG_customer_rating as 
select Vehicle_Type,round(avg(Customer_Rating),2) as avg_rating from ola_booking
group by Vehicle_Type;

select * from avg_customer_rating;

--  9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_ride_value from ola_booking
where Booking_Status="success";

select * from total_successful_ride_value;

--  10. List all incomplete rides along with the reason:
create view incomplete_ride_reason as 
select Booking_ID ,Incomplete_Rides_Reason from ola_booking
where Incomplete_Rides="yes";

select * from incomplete_ride_reason;




