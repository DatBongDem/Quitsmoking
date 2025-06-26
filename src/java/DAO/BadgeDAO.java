/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Badge;
import DTO.Member;
import DTO.MemberBadgeRankingDTO;
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
        String sql = "SELECT b.IDBadge, b.name, b.condition, b.description "
                + "FROM Badge b JOIN BadgeDetail bd ON b.IDBadge = bd.IDBadge "
                + "WHERE bd.IDMember = ?";

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

    public List<MemberBadgeRankingDTO> getRankingByStatus() throws Exception {
        List<MemberBadgeRankingDTO> list = new ArrayList<>();
        String sql
                = "SELECT m.IDMember, m.memberName, m.status, COUNT(bd.IDBadge) AS badgeCount "
                + "FROM Member m "
                + "JOIN BadgeDetail bd ON m.IDMember = bd.IDMember "
                + "GROUP BY m.IDMember, m.memberName, m.status "
                + "ORDER BY m.status, badgeCount DESC";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                MemberBadgeRankingDTO rank = new MemberBadgeRankingDTO();
                rank.setIdMember(rs.getString("IDMember"));
                rank.setMemberName(rs.getString("memberName"));
                rank.setStatus(rs.getString("status"));
                rank.setBadgeCount(rs.getInt("badgeCount"));
                list.add(rank);
            }
        }
        return list;
    }

    public static List<Member> getBadgeRankingByStatus(String status) throws Exception {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT m.IDMember, m.memberName, COUNT(bd.IDBadge) AS badgeCount "
                + "FROM Member m "
                + "JOIN BadgeDetail bd ON m.IDMember = bd.IDMember "
                + "WHERE m.status = ? "
                + "GROUP BY m.IDMember, m.memberName "
                + "ORDER BY badgeCount DESC";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Member m = new Member();
                m.setIDMember(rs.getString("IDMember"));
                m.setMemberName(rs.getString("memberName"));
                m.setPoint(rs.getInt("badgeCount")); 
                list.add(m);
            }
        }

        return list;
    }
}
