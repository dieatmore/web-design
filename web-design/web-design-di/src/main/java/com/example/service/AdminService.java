package com.example.service;

import com.example.entity.New;
import com.example.entity.Notice;
import com.example.util.DataSourceUtils;

import java.io.InputStream;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AdminService {
    public static List<New> listNews() {
        List<New> news  = new ArrayList<>();
        String sql = "select * from new";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                New n = new New();
                n.setId(rs.getInt("id"));
                n.setName(rs.getString("name"));
                n.setContent(rs.getString("content"));
                n.setImageStream(rs.getBinaryStream("image_path"));
                n.setInsertTime(rs.getObject("insert_time", LocalDateTime.class));
                n.setUpdateTime(rs.getObject("update_time", LocalDateTime.class));
                news.add(n);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return news;
    }

    public static List<Notice> listNotices() {
        List<Notice> notices = new ArrayList<>();
        String sql = "select * from notice";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Notice n = new Notice();
                n.setId(rs.getInt("id"));
                n.setName(rs.getString("name"));
                n.setContent(rs.getString("content"));
                n.setInsertTime(rs.getObject("insert_time", LocalDateTime.class));
                n.setUpdateTime(rs.getObject("update_time", LocalDateTime.class));
                notices.add(n);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return notices;
    }

    public static List<New> listLatestNews() {
        List<New> news = new ArrayList<>();
        String sql = "SELECT * FROM new ORDER BY insert_time DESC LIMIT 5";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                New n = new New();
                n.setId(rs.getInt("id"));
                n.setName(rs.getString("name"));
                n.setContent(rs.getString("content"));
                n.setImageStream(rs.getBinaryStream("image_path"));
                n.setInsertTime(rs.getObject("insert_time", LocalDateTime.class));
                n.setUpdateTime(rs.getObject("update_time", LocalDateTime.class));
                news.add(n);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return news;
    }

    public static List<Notice> listLatestNotices() {
        List<Notice> notices = new ArrayList<>();
        String sql = "select * from notice ORDER BY insert_time DESC LIMIT 5";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Notice n = new Notice();
                n.setId(rs.getInt("id"));
                n.setName(rs.getString("name"));
                n.setContent(rs.getString("content"));
                n.setInsertTime(rs.getObject("insert_time", LocalDateTime.class));
                n.setUpdateTime(rs.getObject("update_time", LocalDateTime.class));
                notices.add(n);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return notices;
    }

    public static New getNew(int id) {
        String sql = "select * from new where new.id=?";
        New n = null;
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);) {
            ps.setInt(1,id);
            try(ResultSet rs = ps.executeQuery()) {
                if(rs.next()) {
                    n = new New();
                    n.setId(rs.getInt("id"));
                    n.setName(rs.getString("name"));
                    n.setContent(rs.getString("content"));
                    n.setImageStream(rs.getBinaryStream("image_path"));
                    n.setInsertTime(rs.getObject("insert_time", LocalDateTime.class));
                    n.setUpdateTime(rs.getObject("update_time", LocalDateTime.class));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return n;
    }

    public static Notice getNotice(int id) {
        String sql = "select * from notice where notice.id=?";
        Notice n = null;
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);) {
            ps.setInt(1,id);
            try(ResultSet rs = ps.executeQuery()) {
                if(rs.next()) {
                    n = new Notice();
                    n.setId(rs.getInt("id"));
                    n.setName(rs.getString("name"));
                    n.setContent(rs.getString("content"));
                    n.setInsertTime(rs.getObject("insert_time", LocalDateTime.class));
                    n.setUpdateTime(rs.getObject("update_time", LocalDateTime.class));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return n;
    }

    public static void addNew(String name, String content, InputStream imgStream) {
        String sql = "insert into new(name,content,image_path) values(?,?,?)";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);) {
            ps.setString(1,name);
            ps.setString(2,content);
            ps.setBinaryStream(3, imgStream);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void addNotice(String name,String content) {
        String sql = "insert into notice(name,content) values(?,?)";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);) {
            ps.setString(1,name);
            ps.setString(2,content);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteNew(int id) {
        String sql = "delete from new where new.id = ?";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);) {
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteNotice(int id) {
        String sql = "delete from notice where notice.id = ?";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);) {
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateNew(int id,String name,String content,InputStream imgStream) {
        String sql = "update new n set n.name=?,n.content=?,n.image_path=? where n.id=?";
        try(Connection coon = DataSourceUtils.getConnection();
        PreparedStatement ps = coon.prepareStatement(sql);) {
            ps.setString(1,name);
            ps.setString(2,content);
            ps.setBinaryStream(3, imgStream);
            ps.setInt(4,id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateNotice(int id,String name,String content) {
        String sql = "update notice n set n.name=?,n.content=? where n.id=?";
        try(Connection coon = DataSourceUtils.getConnection();
            PreparedStatement ps = coon.prepareStatement(sql);) {
            ps.setString(1,name);
            ps.setString(2,content);
            ps.setInt(3,id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
