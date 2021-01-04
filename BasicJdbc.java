/*
 * The MIT License (MIT)
 * Copyright (c) 2020 Leif Lindbäck
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction,including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so,subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package se.kth.iv1351.jdbcintro;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.util.ArrayList;

/**
 * A small program that illustrates how to write a simple JDBC program.
 */
public class BasicJdbc {
  private static final String TABLE_NAME = "person";
  private PreparedStatement createPersonStmt;
  private PreparedStatement findAllPersonsStmt;
  private PreparedStatement deletePersonStmt;
  private PreparedStatement listInstrumentsQuery;
  private PreparedStatement instrumentStockIDs;
  private PreparedStatement studentLogin;
  private PreparedStatement rentInstrumentInsert;
  private PreparedStatement stockAvailableUpdate;
  private PreparedStatement countRentedInstruments;
  private PreparedStatement terminateRentalUpdate;
  private PreparedStatement findStockIDFromRentalQuery;
  private PreparedStatement findSpecificInstrument;
  private PreparedStatement listSpecificInstrumentsQuery;

  Scanner scanner = new Scanner(System.in);
  public int studentID = 0;
  public int rentedCounter = 0;

  private void accessDB() {
    try (Connection connection = createConnection()) {

      prepareStatements(connection);

      System.out.println("welcome to soundgood\ntype 'help' for a list of commands");
      while(true){
        String userInput = scanner.nextLine();
        String[] splitInput = userInput.split(" ");
        String command = splitInput[0];
        int number;
        
        if(command.equalsIgnoreCase("help")){
          System.out.println("\nlist_instruments\nrent_instrument (instrument ID) (months)\nlogin (student ID)\nterminate_rental (rental ID)\nlist_rented\nexit\nlist_type (type)\n");

        } else if(command.equalsIgnoreCase("login")){
          login(connection, splitInput); // read

        }else if(command.equalsIgnoreCase("list_instruments") && studentID != 0){ // display stock instruments
          listInstruments(connection); // read

        } else if(command.equalsIgnoreCase("rent_instrument") && studentID != 0){ // rent an instrument X for Y months
          rentInstrument(connection, splitInput); // read, write
          
        } else if(command.equalsIgnoreCase("exit")){ // exit application
          break;

        } else if(command.equalsIgnoreCase("terminate_rental")){ // terminate rental X
          terminateRental(connection, splitInput); // read, write

        } else if(command.equalsIgnoreCase("list_rented") && studentID != 0){ // displays all current rented instruments for logged in student
          listRented(connection); // read

        } else if(command.equalsIgnoreCase("list_type") && studentID != 0) {
          listSpecificInstruments(connection, splitInput);

        } else if(studentID == 0){
          System.out.println("please login first, type 'help' for a list of commands");
        }else {
          System.out.println("invalid command, type 'help' for a list of commands");
        }
      }
      connection.close();
    } catch (SQLException | ClassNotFoundException exc) {
      exc.printStackTrace();
    }
  }

  private Connection createConnection() throws SQLException, ClassNotFoundException {
    Class.forName("org.postgresql.Driver");
    Connection connection =  DriverManager.getConnection("jdbc:postgresql://localhost:5432/simplejdbc",
      "postgres", "postgres");
      connection.setAutoCommit(false);
      return connection;
    // Class.forName("com.mysql.cj.jdbc.Driver");
    // return DriverManager.getConnection(
    // "jdbc:mysql://localhost:3306/simplejdbc?serverTimezone=UTC",
    // "root", "javajava");
  }

  private void terminateRental(Connection connection, String[] stringSplit) { // READ, WRITE, MAIN, DONE

    ResultSet stockFromStudentRental = null;
    try{ // big wrap try

      int number = 0;
      try{ // test if we have a valid 2nd argument
        number = Integer.parseInt(stringSplit[1]);
      } catch(NumberFormatException | ArrayIndexOutOfBoundsException e){
        System.out.println("sorry, wrong format, try again");
        return;
      }
  
        // if the number does not exists or student does not have number ID rented, does a query with no result (terminateRentalUpdate)

        terminateRentalUpdate.setInt(1, studentID); // student ID
        terminateRentalUpdate.setInt(2, number); // rented instrument ID
        terminateRentalUpdate.executeUpdate(); // updates the lease_end date to today for chosen rented ID and student ID
  
        findStockIDFromRentalQuery.setInt(1, number); // rented instrument ID
        findStockIDFromRentalQuery.setInt(2, studentID); //student ID
  
        stockFromStudentRental = findStockIDFromRentalQuery.executeQuery(); // find what stock the rented instrument belongs to
        int foundStock = 0;

        while(stockFromStudentRental.next()){ // finds the instrument stock corresponding to the rental ID
          foundStock = Integer.parseInt(stockFromStudentRental.getString(1));
        }

        if(foundStock != 0){
          stockAvailableUpdate.setInt(1, +1); // +1 to increment
          stockAvailableUpdate.setInt(2, foundStock); // stock instrument ID
          stockAvailableUpdate.executeUpdate(); // increments the available int for instrument
          System.out.println("rental termination has been attempted for instrument: " + number);
        } else {
          System.out.println("there is no such stock");
        }

        connection.commit();

    } catch(SQLException sqle) {
      rollbackFunction(connection, sqle.getMessage()); // rollback
      sqle.printStackTrace();
    } finally {
      closeFunction(stockFromStudentRental);
    }
  }

  private ResultSet countRented(ResultSet query) throws SQLException { // HELPER, DONE
    rentedCounter = 0;
    countRentedInstruments.setInt(1, studentID);
    //ResultSet query = countRentedInstruments.executeQuery();
    query = countRentedInstruments.executeQuery();
    while (query.next()){
      //System.out.println("instrument: " + Integer.parseInt(query.getString(1)));
      rentedCounter++;
    }
    //query.close();
    return query;
  }

  private void login(Connection connection, String[] stringSplit) { // READ, MAIN, DONE

    ResultSet IDs = null;
    try{
      int i = 0;
      boolean loggedIn = false;
      int number = 0;
  
      try{ // test if we have a valid 2nd argument
        number = Integer.parseInt(stringSplit[1]);
      } catch(NumberFormatException | ArrayIndexOutOfBoundsException e){
        System.out.println("sorry, wrong format, try again");
        return;
      }
      
      IDs = studentLogin.executeQuery();
      while (IDs.next()) {
        if(number == Integer.parseInt(IDs.getString(1))){
          studentID = number;
          loggedIn = true;
          System.out.println("you have logged in as user: " + number);
        }
      }

      if(loggedIn == false){
        System.out.println("failed to login, there is no user: " + number);
      }

      connection.commit();
    } catch (SQLException sqle) {
      sqle.printStackTrace();
    } finally {
      closeFunction(IDs);
    }
  }

  private void listSpecificInstruments(Connection connection, String[] stringSplit) {
    ResultSet sInstruments = null;
    String argument;
    boolean flag = false;
    try{ // test if we have a valid 2nd argument
      argument = stringSplit[1];
    } catch(NumberFormatException | ArrayIndexOutOfBoundsException e){
      System.out.println("sorry, wrong format, try again");
      return;
    }
    try{
      listSpecificInstrumentsQuery.setString(1, argument);
      sInstruments = listSpecificInstrumentsQuery.executeQuery();
      while (sInstruments.next()) {
        flag = true;
        System.out.println(
            "id: " + sInstruments.getString(1) + ", name: " + sInstruments.getString(2) + ", type: "
            + sInstruments.getString(3) + ", brand: " + sInstruments.getString(4) + ", rental fee: "
            + sInstruments.getString(5) + ", available amount: " + sInstruments.getString(6));
      }

      if(flag == false){
        System.out.println("no such instruments were found\n");
      }
      connection.commit();
    } catch (SQLException sqle) {
      sqle.printStackTrace();
    } finally {
      closeFunction(sInstruments);
    }
  }

  private void rentInstrument(Connection connection, String[] stringSplit){ // READ, WRITE, MAIN, DONE
    
    ResultSet results = null;
    ResultSet query = null;

    try{ // big wrap try
      int number = 0;
      int month = 0;
      boolean rented = false;
    try{ // test if we have a valid 2nd and 3rd argument
      number = Integer.parseInt(stringSplit[1]);
      month = Integer.parseInt(stringSplit[2]);
    } catch(NumberFormatException | ArrayIndexOutOfBoundsException e){
      System.out.println("sorry, wrong format, try again");
      return;
    }

    if(month == 0 || month > 12){ // edgecase
      System.out.println("sorry, must rent for longer than 0 months and shorter than 12");
      return;
    }

    results = listInstrumentsQuery.executeQuery(); // SQL query, read only
      while (results.next()) {
        if(number == Integer.parseInt(results.getString(1))){ // the instrument id exists

            query = countRented(query); // returns a ResultSet so we can close it in this function, the function modifies a global variable

            if(rentedCounter > 1){ // too many rented instruments
              System.out.println("you have too many instruments already, you have: " + rentedCounter);
              return;
            }

            long millis = System.currentTimeMillis();  
            java.sql.Date startdate = new java.sql.Date(millis); 
            java.sql.Date enddate = new java.sql.Date(millis + (2629800000L*month)); // millisec of a month
            
            rentInstrumentInsert.setDate(1, startdate); // start date
            rentInstrumentInsert.setDate(2, enddate); // end date
            rentInstrumentInsert.setInt(3, studentID); // student id
            rentInstrumentInsert.setInt(4, number); // stock id
            rentInstrumentInsert.executeUpdate(); // add rented instrument

            stockAvailableUpdate.setInt(1, -1); // -1 to decrement
            stockAvailableUpdate.setInt(2, number);
            stockAvailableUpdate.executeUpdate(); // decrement available

            rented = true;
            System.out.println("you are now renting an instrument from stock: " + number);
        }
      }
      if(rented == false){
        System.out.println("the instrument you requested does not exist in our stock");
      }

      connection.commit(); // commit

    } catch (SQLException sqle){
      rollbackFunction(connection, sqle.getMessage()); // rollback
      sqle.printStackTrace();
    } finally {
      closeFunction(results);
      closeFunction(query);
    }
  }

  private void listRented(Connection connection) { // READ, MAIN, DONE
    ResultSet instruments = null;
    try{
      countRentedInstruments.setInt(1, studentID);
      boolean flag = false;
      instruments = countRentedInstruments.executeQuery();
        while (instruments.next()) {
          flag = true;
          System.out.println(
              "id: " + instruments.getString(1) + ", lease_start: " + instruments.getString(2) + ", lease_end: "
              + instruments.getString(3) + ", stock_id: " + instruments.getString(4));
        }
      if(flag == false){
        System.out.println("you have no rented instruments");
      }

      connection.commit();
      instruments.close();

    } catch (SQLException sqle){
      sqle.printStackTrace();
    } finally {
      closeFunction(instruments);
    }
  }

  private void listInstruments(Connection connection) { // READ, MAIN, DONE
    ResultSet instruments = null;
    try{
      instruments = listInstrumentsQuery.executeQuery();
      while (instruments.next()) {
        System.out.println(
            "id: " + instruments.getString(1) + ", name: " + instruments.getString(2) + ", type: "
            + instruments.getString(3) + ", brand: " + instruments.getString(4) + ", rental fee: "
            + instruments.getString(5) + ", available amount: " + instruments.getString(6));
      }

      connection.commit();
    } catch (SQLException sqle) {
      sqle.printStackTrace();
    } finally {
      closeFunction(instruments);
    }
  }

  private void rollbackFunction(Connection connection, String errorMsg){
    try{
      connection.rollback();
    } catch(SQLException rollbackExc) {
      System.out.println(errorMsg + ", also error with: " + rollbackExc.getMessage());
    }
  }

  private void closeFunction(ResultSet resultset){
    try{
      resultset.close();
    } catch(Exception error) {

    }
  }

  private void prepareStatements(Connection connection) throws SQLException {
    createPersonStmt = connection.prepareStatement("INSERT INTO " + TABLE_NAME + " VALUES (?, ?, ?)");
    findAllPersonsStmt = connection.prepareStatement("SELECT * from " + TABLE_NAME);
    deletePersonStmt = connection.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE name = ?");

    listInstrumentsQuery = connection.prepareStatement("SELECT * from instrument_stock WHERE instrument_stock.available_amount > 0");
    instrumentStockIDs = connection.prepareStatement("SELECT instrument_stock.id as id FROM instrument_stock WHERE instrument_stock.available_amount > 0");
    studentLogin = connection.prepareStatement("SELECT student.id as id FROM student");
    
    rentInstrumentInsert = connection.prepareStatement("INSERT INTO rented_instrument(lease_start, lease_end, student_id, instrument_stock_id) VALUES(?, ?, ?, ?)");
    stockAvailableUpdate = connection.prepareStatement("UPDATE instrument_stock SET available_amount = available_amount + ? WHERE instrument_stock.id = ?");
    
    findStockIDFromRentalQuery = connection.prepareStatement("SELECT instrument_stock_id FROM rented_instrument WHERE rented_instrument.id = ? AND rented_instrument.student_id = ?");

    countRentedInstruments = connection.prepareStatement("SELECT id, lease_start, lease_end, instrument_stock_id FROM rented_instrument WHERE rented_instrument.student_id = ? AND (lease_end > CURRENT_DATE)");
    terminateRentalUpdate = connection.prepareStatement("UPDATE rented_instrument SET lease_end = CURRENT_DATE WHERE rented_instrument.student_id = ? AND rented_instrument.id = ?");

    instrumentStockIDs = connection.prepareStatement("SELECT * FROM instrument_stock as ins WHERE ins.available_amount > 0 AND ins.instrument = ?");
    listSpecificInstrumentsQuery = connection.prepareStatement("SELECT * FROM instrument_stock WHERE instrument_stock.available_amount > 0 AND instrument_stock.instrument = ?");
  }

  // make sure that instrument sock with <= 0 elements dont show in list_instruments
  // rollbacks!!

  public static void main(String[] args) {
    new BasicJdbc().accessDB();
  }
}
