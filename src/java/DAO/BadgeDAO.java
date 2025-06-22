/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Badge;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Tien Dat
 */
public class BadgeDAO {
    public List<Badge> getBadgesByMember(String idMember) throws Exception {
        List<Badge> list = new ArrayList<>();
        String sql = "SELECT b.IDBadge, b.name, b.condition, b.description " +
                     "FROM Badge b JOIN BadgeDetail bd ON b.IDBadge = bd.IDBadge " +
                     "WHERE bd.IDMember = ?";

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, idMember);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Badge badge = new Badge(
                        rs.getString("IDBadge"),
                        rs.getString("name"),
                        rs.getString("condition"),
                        rs.getString("description")
                );
                list.add(badge);
            }
        }
        return list;
    }
}
