package service;


import vo.gtaBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class gtaMgr {

    private static String DRV = "oracle.jdbc.OracleDriver";
    private static String URL = "jdbc:oracle:thin:@15.164.233.149:1521:XE";
    private static String USR = "scott";
    private static String PWD = "tiger";

    Connection conn = null;
    PreparedStatement pstms = null;
    ResultSet rs = null;

    gtaBoard b = null;

    public gtaMgr() {
    }

    public List<gtaBoard> readList (String keyword, String searchType, int end, int start) throws SQLException {

    }

    public int getTotalCount (String keyword, String searchType) {

    }



}
