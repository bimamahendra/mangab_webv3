/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : mangabv3

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 18/05/2021 13:44:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absen
-- ----------------------------
DROP TABLE IF EXISTS `absen`;
CREATE TABLE `absen`  (
  `ID_ABSEN` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_JADWAL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NIP_DOSEN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERTEMUAN_KE` int(11) NULL DEFAULT NULL,
  `TOPIK_ABSEN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `METODE_ABSEN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TS_ABSEN` datetime(0) NULL DEFAULT NULL,
  `NOTE_ABSEN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JENIS_ABSEN` int(11) NULL DEFAULT NULL,
  `LONG_ABSEN` double NULL DEFAULT NULL,
  `LAT_ABSEN` double NULL DEFAULT NULL,
  `STATUS_ABSEN` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ABSEN`) USING BTREE,
  INDEX `FK_REFERENCE_15`(`ID_JADWAL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of absen
-- ----------------------------
INSERT INTO `absen` VALUES ('LqAh24', 'JDW_P8uUNA', '010163', 2, 'qwe', 'qwe', '2021-05-05 15:06:18', NULL, 1, 112.6075154, -7.966402800000001, 2);

-- ----------------------------
-- Table structure for detail_absen
-- ----------------------------
DROP TABLE IF EXISTS `detail_absen`;
CREATE TABLE `detail_absen`  (
  `ID_DETABSEN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_ABSEN` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GET_NRP` int(11) NULL DEFAULT NULL,
  `STATUS_DETABSEN` int(11) NULL DEFAULT NULL,
  `TS_DETABSEN` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DETABSEN`) USING BTREE,
  INDEX `FK_REFERENCE_17`(`ID_ABSEN`) USING BTREE,
  CONSTRAINT `FK_REFERENCE_17` FOREIGN KEY (`ID_ABSEN`) REFERENCES `absen` (`ID_ABSEN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_absen
-- ----------------------------
INSERT INTO `detail_absen` VALUES ('4npeUoAtygIfNwEW', 'LqAh24', 201131007, 0, NULL);
INSERT INTO `detail_absen` VALUES ('6tnRrgVkI9KiJ8zv', 'LqAh24', 201131008, 0, NULL);
INSERT INTO `detail_absen` VALUES ('CJmDOSpyMwUij0xt', 'LqAh24', 201131009, 0, NULL);
INSERT INTO `detail_absen` VALUES ('CzVBJhwAfc8rLlIo', 'LqAh24', 201131002, 0, NULL);
INSERT INTO `detail_absen` VALUES ('h9xNans8jfiJqBwK', 'LqAh24', 201131004, 0, NULL);
INSERT INTO `detail_absen` VALUES ('OpPCAysBMnwY3heK', 'LqAh24', 201131010, 0, NULL);
INSERT INTO `detail_absen` VALUES ('uUXZkDgxSmGEnQ98', 'LqAh24', 201131003, 0, NULL);
INSERT INTO `detail_absen` VALUES ('VSqayw68ki1FEWoJ', 'LqAh24', 201131006, 0, NULL);
INSERT INTO `detail_absen` VALUES ('Zxnk0fO9A5TLjdal', 'LqAh24', 201131005, 0, NULL);

-- ----------------------------
-- Table structure for dosen
-- ----------------------------
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE `dosen`  (
  `NIP_DOSEN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAMA_DOSEN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL_DOSEN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PASS_DOSEN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS_LOGIN` int(11) NULL DEFAULT NULL,
  `STATUS_PASS` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NIP_DOSEN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO `dosen` VALUES ('010001', 'Ir. Laurentius Noer Andoyo, M.T', 'andoyo@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010004', 'Dipl. Ing Indra Soegiharto S H., MBA.', 'indra.soegiharto@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010034', 'Anita, S.Kom, M.T', 'ant@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010038', 'Dr. Evy Poerbaningtyas, S.Si, M.T.', 'evip@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010040', 'Sugeng Widodo, S.Kom., M.Kom', 'sugengw@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010041', 'Jozua F. Palandi, M.Kom', 'jozuafp@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010045', 'Laila Isyriyah, M.Kom', 'laila@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010050', 'Dr. Eva Handriyantini, S.Kom, M.MT', 'eva@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010052', 'Daniel Rudiaman Sijabat, ST., M.Kom', 'daniel223@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010063', 'Diah Arifah Prastiningtiyas, S.Kom, M.T', 'diah@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010067', 'Setiabudi Sakaria, M.Kom', 'setiabudi@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010077', 'Subari, S.Kom., M.Kom', 'subari@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010078', 'Zusana E. Pudyastuti, S.S., M.Pd', 'zusanacr@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010081', 'Saiful Yahya, S.Sn, M.T', 'yahya@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010096', 'Meivi Kartikasari, S.Kom., M.T', 'meivi.k@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010106', 'Koko Wahyu Prasetyo, S.Kom, M.TI', 'koko@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010128', 'Nira Radita, M.Pd', 'niraradita@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010130', 'Yekti Asmoro Kanthi, S.Si., M.A.B', 'yektiasmoro@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010135', 'Rachman Hardiansyah, S.Pd., M.P.I', 'rachmanhardiansyah@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010152', 'Addin Aditya, M.Kom', 'addin@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010153', 'Ahmad Zakiy Ramadhan,S.Sn., M.Sn', 'zakiramadhan@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010154', 'Febry Eka Purwiantono, S.Kom., M.Kom', 'febry@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010157', 'Triano Nanda Setiabudi, S.Pd., M.Pd', 'triano@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010158', 'Rahmat Kurniawan, S.Pd.,M.Pd', 'rahmat@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010163', 'Bagus Kristomoyo Kristanto, S.Kom., M.MT', 'bagus.kristanto@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010167', 'Adita Ayu Kusumasari S.Sn.,M.Sn', 'adita.kusumasari@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010174', 'Adnan Zulkarnain ,S.Kom., M.M.S.I', 'adnan.zulkarnain@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010175', 'Arif Tirtana , S.Kom., M.Kom', 'arif.tirtana@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('010197', 'Hilman Nuril Hadi , S.Kom., M.Kom', 'hilman@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('040016', 'Rakhmad Maulidi, M.Kom', 'maulidi@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('040063', 'Mahendra Wibawa, S.Sn, M.Pd', 'mahendra@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('040065', 'Chaulina Alfianti Oktavia, S.Kom., M.T', 'chaulina@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);
INSERT INTO `dosen` VALUES ('040077', 'Windarini Cahyadiana, S.E., M.M', 'windarini@stiki.ac.id', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 0, 0);

-- ----------------------------
-- Table structure for jadwal
-- ----------------------------
DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal`  (
  `ID_JADWAL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_PRTMN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERIODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HARI_KELAS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TANGGAL_MULAI` date NULL DEFAULT NULL,
  `TANGGAL_AKHIR` date NULL DEFAULT NULL,
  `WAKTU_AWAL` time(0) NULL DEFAULT NULL,
  `WAKTU_AKHIR` time(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JADWAL`) USING BTREE,
  INDEX `FK_REFERENCE_16`(`ID_PRTMN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal
-- ----------------------------
INSERT INTO `jadwal` VALUES ('JDW_02JeMx', 'PRT_HubfOa', '2020 Genap', 'Minggu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_0jRNrC', 'PRT_lK6QDE', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_1AtkQx', 'PRT_cQypiB', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_1bUZum', 'PRT_BDl3Mj', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_1CiBKw', 'PRT_2pnwLv', '2020 Genap', 'Senin', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_1SPB7G', 'PRT_obcHtf', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_1SsTbY', 'PRT_rtePgB', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_1tVQOx', 'PRT_qFJHIB', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_2K74wR', 'PRT_EbDwxM', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:30:00', '10:00:00');
INSERT INTO `jadwal` VALUES ('JDW_2Lxk3N', 'PRT_JelnUz', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_2qJ9C0', 'PRT_OYiekw', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_2VUx3c', 'PRT_yJW5kf', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '13:30:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('JDW_3D9sFW', 'PRT_37jcfe', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '11:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_3HVeJX', 'PRT_EhKjlJ', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_3Jm908', 'PRT_ZFUNJ0', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_3ot5f7', 'PRT_Yd9S5i', '2020 Genap', 'Rabu', '2021-03-08', '2021-07-31', '19:30:00', '21:00:00');
INSERT INTO `jadwal` VALUES ('JDW_3TSI9K', 'PRT_v1ECl2', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '11:20:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_3uIgnP', 'PRT_08Imkt', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_4ahzjp', 'PRT_ebucCy', '2020 Genap', 'Senin', '2021-03-08', '2021-07-31', '19:30:00', '21:00:00');
INSERT INTO `jadwal` VALUES ('JDW_4F1tVm', 'PRT_bzFT4a', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:30:00', '10:00:00');
INSERT INTO `jadwal` VALUES ('JDW_4shLW7', 'PRT_ZhgYzO', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_4TY7dZ', 'PRT_xdrCTH', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_4vwH7a', 'PRT_JI3pgo', '2020 Genap', 'Senin', '2021-03-08', '2021-07-31', '19:30:00', '21:00:00');
INSERT INTO `jadwal` VALUES ('JDW_4w9qxh', 'PRT_AQfphM', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_5sjuex', 'PRT_upfOPQ', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_605f82', 'PRT_M3RNKn', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '15:30:00', '17:10:00');
INSERT INTO `jadwal` VALUES ('JDW_64HLen', 'PRT_x48CH6', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:00:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_6C4W31', 'PRT_RDAIOH', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_6NTKP3', 'PRT_ZLw6IV', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:00:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_6Oc5in', 'PRT_5ArFCs', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_78pDEd', 'PRT_Im3DQt', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_7lyuhJ', 'PRT_tz24YA', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_7wB6HQ', 'PRT_kcjxUT', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_7WZzRM', 'PRT_xHn1B0', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_87HSU9', 'PRT_ah906Q', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '16:20:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_8g3nV4', 'PRT_omPEsi', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_8HzU7i', 'PRT_zvm9o0', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '08:00:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_8R4i1y', 'PRT_DNqXgp', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_8VNakc', 'PRT_lX32Ww', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_8yih7L', 'PRT_s20dwF', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_9BhQaj', 'PRT_LQYzWf', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_9NqaoK', 'PRT_ED72NR', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:00:00', '11:30:00');
INSERT INTO `jadwal` VALUES ('JDW_9v7o34', 'PRT_oCpReD', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_9VX4ND', 'PRT_dUwmcH', '2020 Genap', 'Selasa', '2021-03-08', '2021-07-31', '19:30:00', '21:00:00');
INSERT INTO `jadwal` VALUES ('JDW_ApIyZe', 'PRT_A97cQK', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_atDXTZ', 'PRT_e7EnHu', '2020 Genap', 'Selasa', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_AwK2NR', 'PRT_2ij4Ab', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '18:30:00', '20:00:00');
INSERT INTO `jadwal` VALUES ('JDW_aXQySK', 'PRT_9gWTH8', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '11:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_axWk0L', 'PRT_8jISRJ', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_B4UbgI', 'PRT_FPaxUe', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:30:00', '10:00:00');
INSERT INTO `jadwal` VALUES ('JDW_BdbY10', 'PRT_KbsIoy', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_BEVXMm', 'PRT_WOJsAx', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_bJ3aig', 'PRT_k5tlrz', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '07:10:00', '08:50:00');
INSERT INTO `jadwal` VALUES ('JDW_BJGgwW', 'PRT_AwjrM2', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:00:00', '11:30:00');
INSERT INTO `jadwal` VALUES ('JDW_bmxCKL', 'PRT_ZwFEkL', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_Bq5u4z', 'PRT_lE87Tv', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:00:00', '11:30:00');
INSERT INTO `jadwal` VALUES ('JDW_c1u2Cg', 'PRT_eh87O4', '2020 Genap', 'Rabu', '2021-03-08', '2021-07-31', '19:30:00', '21:00:00');
INSERT INTO `jadwal` VALUES ('JDW_c6sRXn', 'PRT_mneA9G', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_caxwLP', 'PRT_Rosztm', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '16:20:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_cIiZCU', 'PRT_4cuVTq', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '15:00:00', '16:30:00');
INSERT INTO `jadwal` VALUES ('JDW_ClnEQ5', 'PRT_1USCLN', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '20:00:00', '21:30:00');
INSERT INTO `jadwal` VALUES ('JDW_COT3Yt', 'PRT_VeoOkG', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_cqPFbJ', 'PRT_TK32f0', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:30:00', '10:00:00');
INSERT INTO `jadwal` VALUES ('JDW_ctgq12', 'PRT_JdD5Ve', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_cwn7Ld', 'PRT_iUhkKL', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_CzAn8u', 'PRT_5HUryF', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_D1gm0F', 'PRT_p3MEvi', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_D1YCAf', 'PRT_bxLH9V', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_DbXJ2P', 'PRT_RTOCSs', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_dHuCnc', 'PRT_K1SgFx', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '18:30:00', '20:00:00');
INSERT INTO `jadwal` VALUES ('JDW_DLHpge', 'PRT_XVb7yW', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_dM8V3U', 'PRT_AJ5LlM', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_dTDZvi', 'PRT_FIlUeK', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_dY965p', 'PRT_OtN0en', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '11:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_DzE0a1', 'PRT_5NzQCE', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_E0iZcV', 'PRT_vNhYtE', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_E2mw1A', 'PRT_3sZaYF', '2020 Genap', 'Minggu', '2021-03-01', '2021-07-31', '08:00:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('JDW_e2zycP', 'PRT_ny23TF', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_Eam7ds', 'PRT_5nCPch', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '11:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_EbAItc', 'PRT_shAwgP', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_EDg4Vn', 'PRT_o05xs3', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_EGLCQ0', 'PRT_0VAlHg', '2020 Genap', 'Minggu', '2021-03-01', '2021-07-31', '07:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_Eh93Qn', 'PRT_zk4EGF', '2020 Genap', 'Minggu', '2021-03-01', '2021-07-31', '08:00:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('JDW_EKcsX0', 'PRT_jd49Dt', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_ElByaw', 'PRT_duatyv', '2020 Genap', 'Selasa', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_eLFcXh', 'PRT_nTiyHC', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_eol9WU', 'PRT_JDI3lv', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_EQDRfC', 'PRT_eqrAid', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_eQyUjV', 'PRT_MDkg1K', '2020 Genap', 'Senin', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_EsMY9b', 'PRT_JrwNbV', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_F5Idz2', 'PRT_wWkYzd', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '20:00:00', '21:30:00');
INSERT INTO `jadwal` VALUES ('JDW_Fhownl', 'PRT_TaiftL', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_FmQqGi', 'PRT_rW5Ol1', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '08:00:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_FsLkC9', 'PRT_x4K0s6', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_fWQXso', 'PRT_8veKCS', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '13:50:00', '16:20:00');
INSERT INTO `jadwal` VALUES ('JDW_FXlxM8', 'PRT_rMTI8l', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_fyaJNz', 'PRT_SbNlJf', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_G5AhfR', 'PRT_rWVMjI', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_Gazv0p', 'PRT_7cmgkb', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_GfHOxN', 'PRT_Rbu3lz', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_gKZGdf', 'PRT_mDYw1a', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_GSdEQp', 'PRT_P4UyjJ', '2020 Genap', 'Kamis', '2021-03-08', '2021-07-31', '19:30:00', '21:00:00');
INSERT INTO `jadwal` VALUES ('JDW_GvjfHR', 'PRT_0OtB5f', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_GxisNF', 'PRT_J8FtLI', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_H2cAvO', 'PRT_dNjqPx', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_HA4yXN', 'PRT_IXmPKs', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_heKcNg', 'PRT_vyGS6F', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_hFv0Ln', 'PRT_nzhcNx', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_hq9Zo5', 'PRT_3bc1Il', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '18:30:00', '20:00:00');
INSERT INTO `jadwal` VALUES ('JDW_hs4GQi', 'PRT_0YbQJm', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_hxuGPc', 'PRT_Mg89qI', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_Hy1wZt', 'PRT_PwJeos', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_HyaEmf', 'PRT_EleUnq', '2020 Genap', 'Minggu', '2021-03-01', '2021-07-31', '08:00:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('JDW_HyX0iU', 'PRT_yG2mMp', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_ICebnP', 'PRT_yatQ8n', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '20:00:00', '21:30:00');
INSERT INTO `jadwal` VALUES ('JDW_IJs7Ng', 'PRT_bdY9qy', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:00:00', '11:30:00');
INSERT INTO `jadwal` VALUES ('JDW_ILhJlk', 'PRT_5gy0pF', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:00:00', '11:30:00');
INSERT INTO `jadwal` VALUES ('JDW_ioO79d', 'PRT_EGvo2J', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_IqPJ0C', 'PRT_QJAsaD', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_It4QZS', 'PRT_VGE12Z', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:30:00', '10:00:00');
INSERT INTO `jadwal` VALUES ('JDW_IThR06', 'PRT_dhtK4H', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:30:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_Its4v5', 'PRT_b6NwDG', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_iyBgsR', 'PRT_oAJWwe', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_j4y6p8', 'PRT_s7Cr1e', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_jDVSnf', 'PRT_nyRs2M', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '18:30:00', '20:00:00');
INSERT INTO `jadwal` VALUES ('JDW_jgdnqa', 'PRT_chuO0L', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_jmXdHk', 'PRT_BVNbWZ', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_jokI3K', 'PRT_9CSoxV', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_JRxXNq', 'PRT_aK1wTm', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '15:00:00', '16:30:00');
INSERT INTO `jadwal` VALUES ('JDW_Jx4pqM', 'PRT_ZGILPF', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_km72iV', 'PRT_jLhAXJ', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_kmG2eF', 'PRT_DiNI01', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_KvHbOR', 'PRT_CzfU9m', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_l81wRL', 'PRT_SlTU9C', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_LkpBm0', 'PRT_zJ6AvC', '2020 Genap', 'Rabu', '2021-03-08', '2021-07-31', '18:30:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_lmSbE0', 'PRT_EzH8Uf', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_LpjSDh', 'PRT_1uBCYD', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_LpM6tD', 'PRT_QMaKUz', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_LSjwKu', 'PRT_9uTQKS', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_LzpQOe', 'PRT_9GiMKj', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:00:00', '11:30:00');
INSERT INTO `jadwal` VALUES ('JDW_M4cVwy', 'PRT_ruJhLv', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_M7j4Hg', 'PRT_c2ACIZ', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '13:30:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('JDW_MF1y9d', 'PRT_VyBkJp', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_mIVFDY', 'PRT_6wHSQC', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_mKPTr7', 'PRT_7XLVEt', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_MKqSyx', 'PRT_1bWwfx', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '13:50:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_mNcr7D', 'PRT_jYCtc0', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '11:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_Mo0D1w', 'PRT_7Rflsz', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '11:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_MO7TY3', 'PRT_KHR1gX', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_mUyVYe', 'PRT_OyupkQ', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_nAv4XB', 'PRT_WHCUSp', '2020 Genap', 'Minggu', '2021-03-01', '2021-07-31', '08:00:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('JDW_nFo9SN', 'PRT_Q0YIbf', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_ngo2b0', 'PRT_RuOrws', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_niJHR5', 'PRT_Y9Mm8o', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:30:00', '10:00:00');
INSERT INTO `jadwal` VALUES ('JDW_nr0pZH', 'PRT_Dzlb2w', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_nvy2Rt', 'PRT_jS9Irq', '2020 Genap', 'Kamis', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_NXEM03', 'PRT_SImkTL', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:00:00', '11:30:00');
INSERT INTO `jadwal` VALUES ('JDW_O68Ewl', 'PRT_p2T5ki', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_O9CHgx', 'PRT_3QYHj9', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_oCn4UR', 'PRT_hFPdOW', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_OisFIy', 'PRT_G2jsWz', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_ON1jBH', 'PRT_omUITS', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_onNwPh', 'PRT_60BplA', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_OoKt5w', 'PRT_zD82gC', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_oOPxkr', 'PRT_vOX1FP', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '18:30:00', '20:00:00');
INSERT INTO `jadwal` VALUES ('JDW_OUgNCs', 'PRT_jifCD5', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_P2vrpd', 'PRT_oOl2zZ', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_P8uUNA', 'PRT_xQg5fX', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_pB9CM5', 'PRT_MqiIOp', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_pFYfwX', 'PRT_JOAHsD', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_pg9UYG', 'PRT_E1KNsy', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_pk3bAy', 'PRT_2tUYGT', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_pnLAjG', 'PRT_hWvC83', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_pvTiLu', 'PRT_d2hQli', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '18:30:00', '20:00:00');
INSERT INTO `jadwal` VALUES ('JDW_PZk5ji', 'PRT_9PIjAQ', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_q0ISVk', 'PRT_8GQte1', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '15:30:00', '17:10:00');
INSERT INTO `jadwal` VALUES ('JDW_Q3LypJ', 'PRT_HAZqS7', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_q3UX7k', 'PRT_O2VaQC', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '20:00:00', '21:30:00');
INSERT INTO `jadwal` VALUES ('JDW_qEflaV', 'PRT_SIMu2k', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_qGkcY1', 'PRT_If59sQ', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '14:40:00', '17:10:00');
INSERT INTO `jadwal` VALUES ('JDW_qJVKHx', 'PRT_Bmjo0x', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_qQeD5F', 'PRT_aofVhR', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '08:00:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_qQfBjD', 'PRT_yiLEcM', '2020 Genap', 'Selasa', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_qxl90A', 'PRT_l2JHGr', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_qY3kG6', 'PRT_jw3Y80', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_riyXT7', 'PRT_7dOcml', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '08:00:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_RSoc0a', 'PRT_a9RpBL', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_RTerjf', 'PRT_Cu4bWR', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_RufdWy', 'PRT_MDFNJP', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_s2GOWa', 'PRT_qN82Ek', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_SAfEpO', 'PRT_9YhTFq', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_sBTLjq', 'PRT_ei6E27', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '11:20:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_sH6cq3', 'PRT_lRFV4h', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_SHvYMx', 'PRT_95V7Bb', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_SJQkxv', 'PRT_hajKd5', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_SKCnPh', 'PRT_FfJtbP', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '20:00:00', '21:30:00');
INSERT INTO `jadwal` VALUES ('JDW_sNXWjv', 'PRT_QOjlvJ', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '15:30:00', '17:10:00');
INSERT INTO `jadwal` VALUES ('JDW_srAYz0', 'PRT_vOz4rU', '2020 Genap', 'Senin', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_SYIHAb', 'PRT_TLOVuq', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '13:30:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('JDW_SYORAv', 'PRT_JLV0MF', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_tfkab0', 'PRT_P01N5u', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_tnuQwz', 'PRT_qjwmDr', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:00:00', '12:00:00');
INSERT INTO `jadwal` VALUES ('JDW_tQPwcy', 'PRT_nUBx53', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_TqVcCi', 'PRT_oxytCa', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_tYSCBT', 'PRT_7dIZat', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '11:20:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_uAPzTE', 'PRT_euDG7x', '2020 Genap', 'Kamis', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_umtRcK', 'PRT_s1vyBL', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '13:00:00', '14:40:00');
INSERT INTO `jadwal` VALUES ('JDW_UOAvFj', 'PRT_eAjyRK', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_URH9ME', 'PRT_Mkxshc', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_v3tQcC', 'PRT_8zyqRl', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_v3XCWt', 'PRT_RsP49p', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_V4DhUl', 'PRT_ArHJzv', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_voHjAz', 'PRT_YKRbPc', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_vQ21Pq', 'PRT_rdUCnM', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_vVOkia', 'PRT_URQqPG', '2020 Genap', 'Selasa', '2021-03-08', '2021-07-31', '19:30:00', '21:00:00');
INSERT INTO `jadwal` VALUES ('JDW_w3IDTc', 'PRT_l4Fy5z', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '20:00:00', '21:30:00');
INSERT INTO `jadwal` VALUES ('JDW_w47PVZ', 'PRT_XYbpEy', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_W5YI7T', 'PRT_L5xmD3', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '11:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_WbgrSA', 'PRT_C3W19d', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_WEmSD0', 'PRT_Q7tbpe', '2020 Genap', 'Kamis', '2021-03-01', '2021-07-31', '08:00:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_WfpMx4', 'PRT_CeDvlA', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '20:00:00', '21:30:00');
INSERT INTO `jadwal` VALUES ('JDW_WGTPpq', 'PRT_xCH92j', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '10:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_wLW9PZ', 'PRT_NRlmDM', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_WsaNd3', 'PRT_nrPQfU', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_Wybg28', 'PRT_TcS9Wu', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:50:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_X8uyoD', 'PRT_KR2JBP', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_X8z7dU', 'PRT_nwt8sk', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_X9vQR8', 'PRT_dvY29l', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '15:30:00', '17:10:00');
INSERT INTO `jadwal` VALUES ('JDW_xaRcnr', 'PRT_1IMztH', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '18:30:00', '20:00:00');
INSERT INTO `jadwal` VALUES ('JDW_XcPg3L', 'PRT_Q4IZCh', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '11:30:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_XHclfa', 'PRT_gBkZAt', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '07:00:00', '08:30:00');
INSERT INTO `jadwal` VALUES ('JDW_Xm4YAP', 'PRT_Yqobm8', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '07:10:00', '09:40:00');
INSERT INTO `jadwal` VALUES ('JDW_XP5bFq', 'PRT_x0DI2V', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '09:40:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_xYondm', 'PRT_Lygxb2', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '08:30:00', '10:00:00');
INSERT INTO `jadwal` VALUES ('JDW_xyuwZa', 'PRT_KhEc3o', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '15:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('JDW_Y04zaE', 'PRT_aSMcmv', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '17:00:00', '18:30:00');
INSERT INTO `jadwal` VALUES ('JDW_YRZQhW', 'PRT_4YFMrn', '2020 Genap', 'Jumat', '2021-03-01', '2021-07-31', '13:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('JDW_YWEMtS', 'PRT_8oYiwk', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '10:30:00', '12:10:00');
INSERT INTO `jadwal` VALUES ('JDW_zevVyb', 'PRT_5gIS8V', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_zHangX', 'PRT_XYmZ96', '2020 Genap', 'Selasa', '2021-03-01', '2021-07-31', '11:20:00', '13:00:00');
INSERT INTO `jadwal` VALUES ('JDW_zkyIiM', 'PRT_vAOIb1', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '10:00:00', '11:30:00');
INSERT INTO `jadwal` VALUES ('JDW_Zmnhrq', 'PRT_Ur3LuA', '2020 Genap', 'Senin', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_zMph5q', 'PRT_hNHmku', '2020 Genap', 'Sabtu', '2021-03-08', '2021-07-31', '13:30:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('JDW_ZrIv1H', 'PRT_ImVt0h', '2020 Genap', 'Kamis', '2021-03-08', '2021-07-31', '18:00:00', '19:30:00');
INSERT INTO `jadwal` VALUES ('JDW_ztOvBx', 'PRT_fvWkn7', '2020 Genap', 'Rabu', '2021-03-01', '2021-07-31', '08:00:00', '10:30:00');
INSERT INTO `jadwal` VALUES ('JDW_zw6O93', 'PRT_voAZHi', '2020 Genap', 'Sabtu', '2021-03-01', '2021-07-31', '12:00:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('JDW_Zyl5eK', 'PRT_4M3BTX', '2020 Genap', 'Jumat', '2021-03-08', '2021-07-31', '18:30:00', '20:00:00');

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `NRP_MHS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KODE_PRODI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PASS_MHS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAMA_MHS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL_MHS` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_MHS` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS_LOGIN` int(11) NULL DEFAULT NULL,
  `STATUS_PASS` int(11) NULL DEFAULT NULL,
  `LAST_LOGOUT` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`NRP_MHS`) USING BTREE,
  INDEX `FK_REFERENCE_12`(`KODE_PRODI`) USING BTREE,
  CONSTRAINT `FK_REFERENCE_12` FOREIGN KEY (`KODE_PRODI`) REFERENCES `prodi` (`KODE_PRODI`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES ('141111047', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'WAHYU TRI ISMOYO', '141111047@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('141111060', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD TAUFIK A. HASAN', '141111060@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('141111071', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'HELMI FAZAISYAH', '141111071@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('141111092', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ANDREW FIDE PRASETYO', '141111092@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('151111075', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'YOPPIE RADITYA WICAKSONO', '151111075@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('151111091', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'GUSTAV ARTHUR SEBASTIAN', '151111091@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('151111122', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ABSHOR NAUFAR HAKIM', '151111122@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171111003', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'DANIEL HADINATA ADMOJO', '171111003@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171111009', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SUPIANUR', '171111009@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171111028', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RIFDA AMMARINA KARSITA', '171111028@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171111029', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NATANIEL DAVID TEKTANTO', '171111029@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171111098', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'CHOIRUL ANAM', '171111098@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171111115', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'TITANIA TARA SWASTIKA', '171111115@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116009', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'DANDI FERDIANTO', '171116009@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116011', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'DIAN NURHARDIYANTI', '171116011@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116017', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MAULANA SHIDQIE CHAIROEL', '171116017@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116018', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD KHUSNUL KHULUQ', '171116018@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116027', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'TAUFIK SYAIFUL RIZAL', '171116027@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116029', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'TENDHY GUNTUR PRAKOSO', '171116029@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116030', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'VERNI CAHYANTI', '171116030@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116033', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'YULITA DWI ANGGRAENI', '171116033@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171116035', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ISKAK PURNOMO', '171116035@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('171221014', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MATILDA ORA', '171221014@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111001', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SAMUEL ARDIYANTO', '181111001@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111002', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ACHMAD BUYUNG RIYADI', '181111002@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111004', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SYAMSUL MA\'ARIF', '181111004@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111005', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ASNITA LUSIANA', '181111005@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111007', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'IKA ERCHA RAHMAWATI SUNARYA', '181111007@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111008', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'HAFID PUTRA ARIANSYAH', '181111008@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111009', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NADIVA RAMANDANI', '181111009@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111010', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ARNANDO RISTANTA', '181111010@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111015', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'KURNIAT IDAMAN SUKUR TELAUMBANUA', '181111015@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111016', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD FADJRIN LISTO ABADI', '181111016@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111018', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'BUDI PRAYOGI', '181111018@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111020', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'KEVIN YOGA PRATAMA', '181111020@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111021', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'IRFAN FERDIANTO', '181111021@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111023', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'EKANANDA YANWAR JULIANTO', '181111023@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111024', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'FARREL AKBAR RAMADHAN', '181111024@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111028', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'KELVIN ANDIKA SANTOSO', '181111028@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111031', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'YUSAN ABID JANITRA', '181111031@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111033', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'JOSHUA CHRISTIAN OETOMO', '181111033@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111035', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ARIFASIWI MILANDA PUTRI', '181111035@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111036', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'DIMAS DWI PRIAMBODO', '181111036@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111037', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RADHA HANS AZIZAH', '181111037@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111039', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'BAYU SEKTI NAGO PRAKOSA', '181111039@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111040', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ELFAN FABRIANTO', '181111040@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111042', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD TEGAR', '181111042@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111043', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'APRILDA PETER SANDORIA MAKATITA', '181111043@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111046', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ARINKA ARETHUSA', '181111046@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111049', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SHENDY HERTA PRADIKTA ARBI', '181111049@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111055', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'KEMAS ABROR TRI WAHYUWONO', '181111055@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111056', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RINALDI SALEH', '181111056@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111057', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD ZIDAN PERMANA', '181111057@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111058', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ZULFI RIZKIAWAN', '181111058@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111059', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'JOHN ARMAYNDO FERDERICO', '181111059@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111060', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ILHAM SAGITA PUTRA', '181111060@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111062', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'LENNI MELINDA', '181111062@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111063', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ALHAM', '181111063@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111064', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RAMADHAN ARDIGUMELAR', '181111064@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111066', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'GLADIS PUSPA AYU', '181111066@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111067', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ALVIN RIANANDA MUJIARSO', '181111067@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111068', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'REINHART ABRIAN', '181111068@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111069', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RADIK AURIEL', '181111069@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111071', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMAD DJAJA SUPARMAN', '181111071@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111076', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'DEDY HERMAWAN', '181111076@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111078', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'BIMA REYNALDI SUMITRO', '181111078@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111080', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'PUTRI AULIYA RAHMAH BELLADINA MAURIEFTHA', '181111080@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111081', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'HAFEDO RAKHMAD PRASETYO', '181111081@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111082', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MOH. BAHRUL ULUM', '181111082@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111083', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NUR RAHMAN ILHAMZA', '181111083@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111084', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SETYAWAN DWI PRADIKA', '181111084@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111085', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SIHONO', '181111085@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111086', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'YESSA ALDY PRASETYOKO', '181111086@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111087', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ICCO NOFAR HANSYAH', '181111087@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111090', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RIZKY ABDILLAH', '181111090@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111091', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'FAHMI RAMADHANI', '181111091@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111092', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD RIDWAN ILYASA', '181111092@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111093', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RAMADHAN PUTRA PRASETIAWAN', '181111093@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111094', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'PRIAMBODO BUDI SANTOSO', '181111094@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111096', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'WAHYU ANDIKA PRATAMA', '181111096@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111097', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'EL REGINALD CAESARO SAN', '181111097@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111099', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SITI FATIMAH', '181111099@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111100', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RACHMAD ASH SHIDIQY', '181111100@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111103', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RAMADHAN GIRI MUKTI', '181111103@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111107', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD AL KAUSAR', '181111107@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181111108', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ADRIANSYAH DWI PANGESTU PUTRA', '181111108@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181116007', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SAIFUL ARIFIN', '181116007@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181116010', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NADIYAH DWI RANI', '181116010@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181116011', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'YOKANAN CATUR P', '181116011@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181116037', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'BAGUS ADITAMA PRAMANA PUTRA', '181116037@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181116039', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'FAKHRUDDIN IVAN SETYOPRADANA', '181116039@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181116056', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MOHAMAD RIZKY REYNALDY', '181116056@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('181116069', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MIFTAHUL', '181116069@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111001', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MOHAMAD LUTFI HAFIFUDDIN', '191111001@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111002', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'AULIA AGUSTINA ANJANI', '191111002@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111006', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD HASYIM CHAIDIR ALI', '191111006@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111007', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ADITYA GANDHI', '191111007@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111009', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ZAKIYATU ROFIQOH', '191111009@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111011', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ANDREW NAGATA', '191111011@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111012', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NAUFAL DZAKI ABRAR', '191111012@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111013', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'GUARDIAN THEO ANDRITYA', '191111013@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111014', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RONGGO HAIKAL', '191111014@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111017', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'LIMAN CALVIN SANJAYA', '191111017@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111019', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD ARDANTYO BINANGKIT', '191111019@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111020', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MAULANA REZA RISDIYANTO', '191111020@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111021', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MAHESA RAHMA WIJAYA', '191111021@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111022', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'EKA MEI AYU WIDYATI PRASTYO', '191111022@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111024', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'GEORGE ABRAHAM TALAKUA', '191111024@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111025', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD DWI PRASETYO', '191111025@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111026', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'JANREL GEORGE\'GI FENANLAMPIR', '191111026@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111027', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD RIZQY MAHARDIKA', '191111027@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111028', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'CLARADISHA HELENORA DADE', '191111028@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111031', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'GRACIA YOEL CHRISTIAWAN', '191111031@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111034', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ARNOLD CATUR WICAKSONO', '191111034@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111035', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'FAHMI WAFI MUBAROKH', '191111035@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111036', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RAFI FITRA ALAMSYAH', '191111036@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111038', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'GRETA SEPTY PURWIANTONO', '191111038@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111039', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'CENDIKIA FITRI NURIL HALIZAH', '191111039@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111040', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NANDA PUTRA PRATAMA', '191111040@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111041', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD MUTAWALLI SYA\'RAWI', '191111041@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111042', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD WASI\'UL FUADIN NA\'IM SA\'ID', '191111042@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111043', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'BAGUS PAMUNGKAS', '191111043@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111045', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD ARIF AFANDI', '191111045@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111046', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ANGGITO REY ISWARI', '191111046@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111047', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ANDITYA KAHYUNA CHOSUN', '191111047@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111048', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'STEPHANUS DHIMAS HULIO', '191111048@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111050', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'FANI OKTAF LAURISA', '191111050@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111051', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'KEN BAGUS PANULUH YUDHA PERKASA', '191111051@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111052', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'HIKMAH', '191111052@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111053', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'TUBAGUS MOCHAMMAD EZA RIZQI FIRDAUS', '191111053@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111054', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD HUSNI ABDILLAH', '191111054@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111055', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'EKO IRDIAN ADHA', '191111055@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111058', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'VEGA YOBEL WIJAYA', '191111058@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111060', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ABD. MU\'ID', '191111060@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191111062', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ACHMAD SULTON', '191111062@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116001', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'AHMAD MUKHLASIN MA\'RUF', '191116001@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116003', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RICKY DARMAWAN WIDJANARKO', '191116003@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116004', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ROBY FIRNANDO YUSUF', '191116004@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116005', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'SOVITA AGUSTINA', '191116005@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116009', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'DAUD UTOMO', '191116009@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116010', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'HANNAH FITRI NUR AISYAH', '191116010@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116011', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'KUKUH ALFIAN HANIF', '191116011@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116013', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RIZALDI INDRA HERMAWAN', '191116013@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116014', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NIKEN ARRA ILMA AULIYA', '191116014@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116015', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ACHMAD MUSFI\'UL CHAGGI', '191116015@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116016', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'FAHMI AKBAR', '191116016@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116017', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ANTONIUS ANUGRAH DENI DEWANTA', '191116017@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116019', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ROMI SETYA KUSUMA HADI', '191116019@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191116036', 'TI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ABD HALIM ARUMMAN', '191116036@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221001', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ARIQ RIZKY FAHREZIE', '191221001@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221002', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NUZUL ARIF NUR RACHMAN', '191221002@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221003', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NORYAN DWI CAHYA', '191221003@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221006', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'AHMAD RAHMATULLAH AL AGHUTSY', '191221006@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221007', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MOCHAMMAD FACHRIZAL MUZAKKY', '191221007@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221009', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RIZALLO NOVEGA', '191221009@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221010', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'NAUFAL ARDIANSYAH', '191221010@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221012', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD FADHLAN RAMADHAN', '191221012@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221013', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RHAKA GUSTI RAHMADDANI', '191221013@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221014', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'APLONIA JULMIRA LOURDES SALU', '191221014@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221017', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'HIZKIA RIFANTO', '191221017@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221019', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ALFINA ROSYIDA', '191221019@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221021', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RICKY ALVIANTO', '191221021@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('191221026', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'FRENGKI FAJAR ANDILA', '191221026@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201118001', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'DWIKY SATRIA HUTOMO', '201118001@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131002', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'FARIKI RAMADHAN', '201131002@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131003', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MOCHAMMAD ARDI FIKRI', '201131003@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131004', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ACHMAD MAULANA AZZAM', '201131004@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131005', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD DIAN NUGRAHA', '201131005@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131006', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'WIDHIASYWA PRANIDYA ICHARUSSYA', '201131006@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131007', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD NAUFAL GIBRAN', '201131007@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131008', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD RIDHO RAMADHAN', '201131008@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131009', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ABRAR RADAN KARTIKO', '201131009@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201131010', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'WENDHI TRI MUSTIKA RAKHMAT', '201131010@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201136001', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ANANG SUGIARTO', '201136001@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201136002', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'LIA AYU NOVITA SARI', '201136002@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201136003', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'EWALDO PARESKY', '201136003@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201136005', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MERCELLO ADITYA AFFANDI', '201136005@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201136006', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'MUHAMMAD JANNAH EKA PUTRA', '201136006@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201136007', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'DANI ARDHY FIRDAUS', '201136007@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201136008', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'ENJELI ANGGREANI', '201136008@mhs.stiki.ac.id', NULL, 0, 0, NULL);
INSERT INTO `mahasiswa` VALUES ('201136009', 'SI-S1', '6ff59b3e99990f14c53e503d26c209e1064c2c49a9274fe920670ea10710651e', 'RENDY EKO PRASTIYO', '201136009@mhs.stiki.ac.id', NULL, 0, 0, NULL);

-- ----------------------------
-- Table structure for matakuliah
-- ----------------------------
DROP TABLE IF EXISTS `matakuliah`;
CREATE TABLE `matakuliah`  (
  `KODE_MATKUL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KODE_PRODI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAMA_MATKUL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SKS_MATKUL` int(11) NULL DEFAULT NULL,
  `SEMESTER_MATKUL` int(11) NULL DEFAULT NULL,
  `KURIKULUM_MATKUL` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JENIS_MATKUL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`KODE_MATKUL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of matakuliah
-- ----------------------------
INSERT INTO `matakuliah` VALUES ('DK14PB81', 'DK-S1', 'TUGAS AKHIR', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19KB21', 'DK-S1', 'GRAMATIKA VISUAL', 4, 2, '2019', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('DK19KB41', 'DK-S1', 'RANCANG VISUAL IDENTITAS', 4, 4, '2019', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('DK19KB61', 'DK-S1', 'RANCANG PORTFOLIO', 4, 6, '2019', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('DK19KB62', 'DK-S1', 'MUSIK DIGITAL', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('DK19KB64', 'DK-S1', 'EKSPLORASI MEDIA REKAM', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('DK19KB65', 'DK-S1', 'KOMIK', 3, 6, '2019', 'Kelas Laboratorium');
INSERT INTO `matakuliah` VALUES ('DK19KK21', 'DK-S1', 'METODE CETAK GRAFIS', 3, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('DK19KK22', 'DK-S1', 'NIRMANA 2', 3, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('DK19KK23', 'DK-S1', 'FOTOGRAFI', 3, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('DK19KK41', 'DK-S1', 'MULTIMEDIA', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19KK42', 'DK-S1', 'ANIMASI 3D', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19KK43', 'DK-S1', 'COPY WRITING', 2, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('DK19KK44', 'DK-S1', 'PASCA PRODUKSI VIDEOGRAFI', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19PB61', 'DK-S1', 'PRAKTEK KERJA LAPANGAN', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19PB71', 'DK-S1', 'TUGAS KHUSUS', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19PB72', 'DK-S1', 'PRA TUGAS AKHIR', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19PB81', 'DK-S1', 'SEMINAR AKHIR', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19PK21', 'DK-S1', 'PROSES KOMUNIKASI', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19PK22', 'DK-S1', 'METODOLOGI DESAIN', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('DK19PK41', 'DK-S1', 'MANAJEMEN PROYEK', 2, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('DK19PK42', 'DK-S1', 'MARKETING DAN BRANDING', 2, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('DK19PK61', 'DK-S1', 'ETIKA PROFESI', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('KM21KB01', 'SI-S1', 'GOOGLE CLOUD COMPUTING', 4, 6, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI14KB22', 'MI-D3', 'PEMROGRAMAN DASAR I', 3, 2, '2014', 'Kelas Laboratorium');
INSERT INTO `matakuliah` VALUES ('MI14KB43', 'MI-D3', 'DESAIN GRAFIS', 3, 4, '2014', 'Kelas Laboratorium');
INSERT INTO `matakuliah` VALUES ('MI14KB44', 'MI-D3', 'MANAJEMEN PROYEK', 2, 4, '2014', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI14KB46', 'MI-D3', 'PRAKTEK ANALISA DAN PERANCANGAN SISTEM INFORMASI', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('MI14KB52', 'MI-D3', 'DESAIN WEB', 3, 5, '2014', 'Kelas Laboratorium');
INSERT INTO `matakuliah` VALUES ('MI14KB55', 'MI-D3', 'KEAMANAN JARINGAN', 3, 5, '2014', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI14KK22', 'MI-D3', 'SISTEM INFORMASI MANAJEMEN', 3, 2, '2014', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI14KK23', 'MI-D3', 'SISTEM OPERASI', 3, 2, '2014', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI14KK31', 'MI-D3', 'ALGORITMA DAN STRUKTUR DATA II', 3, 3, '2014', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI14KK41', 'MI-D3', 'AKUNTANSI', 3, 4, '2014', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI14PB51', 'MI-D3', 'PRAKTEK KERJA LAPANGAN', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('MI14PB61', 'MI-D3', 'TUGAS AKHIR', 4, 6, '2014', 'Non-Pertemuan');
INSERT INTO `matakuliah` VALUES ('MI14PK61', 'MI-D3', 'BAHASA INGGRIS II', 3, 6, '2014', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI16BB51', 'MI-D3', 'ETIKA PROFESI', 2, 5, '2016', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI16KB41', 'MI-D3', 'INTERAKSI MANUSIA DAN KOMPUTER', 2, 4, '2016', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI16PB62', 'MI-D3', 'TUGAS KHUSUS', 2, 6, '2016', 'Non-Pertemuan');
INSERT INTO `matakuliah` VALUES ('MI20KB21', 'MI-D3', 'BASIS DATA', 4, 2, '2020', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('MI20KB41', 'MI-D3', 'ANALISA DAN PERANCANGAN SISTEM INFORMASI', 4, 4, '2020', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MI20KB45', 'MI-D3', 'PEMROGRAMAN WEB LANJUT', 4, 4, '2020', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('MI20KB51', 'MI-D3', 'APLIKASI MOBILE', 4, 5, '2020', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('MU21BB21', 'MI-D3', 'KECAKAPAN INTERPERSONAL', 2, 2, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21BB31', 'SI-S1', 'BAHASA INDONESIA', 2, 3, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21KB41', 'SI-S1', 'KEWIRAUSAHAAN I', 2, 4, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21KB51', 'SI-S1', 'KEWIRAUSAHAAN II', 2, 5, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21KK21', 'SI-S1', 'STATISTIKA', 3, 2, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21KK61', 'TI-S1', 'METODE PENELITIAN', 2, 6, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21PK11', 'TI-S1', 'BAHASA INGGRIS I', 2, 1, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21PK61', 'DK-S1', 'AGAMA ISLAM', 2, 6, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21PK62', 'DK-S1', 'AGAMA KRISTEN/KATOLIK', 2, 6, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21PK65', 'TI-S1', 'KEWARGANEGARAAN', 2, 6, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('MU21PK81', 'TI-S1', 'BAHASA INGGRIS II', 2, 8, '2021', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI15KK21', 'SI-S1', 'SISTEM INFORMASI MANAJEMEN', 3, 2, '2015', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI15PB81', 'SI-S1', 'TUGAS AKHIR', 6, 8, '2015', 'Non-Pertemuan');
INSERT INTO `matakuliah` VALUES ('SI19BB82', 'SI-S1', 'KECAKAPAN INTERPERSONAL', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('SI19BB83', 'SI-S1', 'ETIKA PROFESI', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('SI19KB42', 'SI-S1', 'SISTEM ENTERPRISE', 3, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KB43', 'SI-S1', 'MANAJEMEN LAYANAN TI', 3, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KB44', 'SI-S1', 'PEMROGRAMAN WEB LANJUT', 4, 4, '2019', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('SI19KB46', 'SI-S1', 'SISTEM INFORMASI AKUNTANSI', 3, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KB53', 'SI-S1', 'MANAJEMEN PROYEK', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('SI19KB61', 'SI-S1', 'BUSINESS INTELLIGENCE', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KB62', 'SI-S1', 'E-BUSINESS', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KB63', 'SI-S1', 'AUDIT SISTEM INFORMASI', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KK21', 'SI-S1', 'SISTEM INFORMASI MANAJEMEN', 3, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KK22', 'SI-S1', 'INFRASTRUKTUR TI', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('SI19KK23', 'SI-S1', 'MANAJEMEN RANTAI PASOK', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('SI19KK24', 'SI-S1', 'BASIS DATA', 4, 2, '2019', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('SI19KK26', 'SI-S1', 'MANAJEMEN PEMASARAN', 2, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KK27', 'SI-S1', 'MANAJEMEN SUMBER DAYA MANUSIA', 2, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KK41', 'SI-S1', 'MANAJEMEN PENGETAHUAN', 2, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19KK42', 'SI-S1', 'ADMINISTRASI PUBLIK', 2, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('SI19PB61', 'SI-S1', 'PRAKTEK KERJA', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('SI19PB71', 'SI-S1', 'TUGAS KHUSUS', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('SI19PB72', 'SI-S1', 'PRA TUGAS AKHIR', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('SI19PB81', 'SI-S1', 'TUGAS AKHIR', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI14PB71', 'TI-S1', 'TUGAS KHUSUS', 3, 7, '2014', 'Non-Pertemuan');
INSERT INTO `matakuliah` VALUES ('TI14PB81', 'TI-S1', 'TUGAS AKHIR', 6, 8, '2014', 'Non-Pertemuan');
INSERT INTO `matakuliah` VALUES ('TI19BB71', 'TI-S1', 'ETIKA PROFESI', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19KB21', 'TI-S1', 'BASIS DATA I', 4, 2, '2019', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('TI19KB22', 'TI-S1', 'ALGORITMA DAN PEMROGRAMAN II', 4, 2, '2019', 'Teori & Praktikum');
INSERT INTO `matakuliah` VALUES ('TI19KB41', 'TI-S1', 'PEMROGRAMAN PERANGKAT BERGERAK I', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19KB42', 'TI-S1', 'PEMROGRAMAN WEB II', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19KB43', 'TI-S1', 'PENGOLAHAN CITRA DIGITAL', 3, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KB44', 'TI-S1', 'REKAYASA PERANGKAT LUNAK', 3, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KB51', 'TI-S1', 'ANALISA KEBUTUHAN PERANGKAT LUNAK', 3, 5, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KD51', 'TI-S1', 'DATA MINING', 3, 5, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KD62', 'TI-S1', 'INFORMATION RETRIEVAL', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KD63', 'TI-S1', 'COMPUTER VISION', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19KK21', 'TI-S1', 'ALJABAR LINIER DAN MATRIK', 3, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KK22', 'TI-S1', 'SISTEM INFORMASI', 3, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KK23', 'TI-S1', 'ORGANISASI DAN ARSITEKTUR KOMPUTER', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19KK24', 'TI-S1', 'STRUKTUR DATA', 3, 2, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KK41', 'TI-S1', 'METODE NUMERIK', 3, 4, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KK52', 'TI-S1', 'APPLICATION PROJECT II', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19KK62', 'TI-S1', 'APPLICATION PROJECT III', 2, 6, '2019', 'Kelas Laboratorium');
INSERT INTO `matakuliah` VALUES ('TI19KK63', 'TI-S1', 'STRATEGI ALGORITMA', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KK64', 'TI-S1', 'KEAMANAN INFORMASI', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KL52', 'TI-S1', 'MANAJEMEN PROYEK', 3, 5, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KN61', 'TI-S1', 'KOMPUTASI AWAN', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KN63', 'TI-S1', 'KRIPTOGRAFI', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19KS51', 'TI-S1', 'PENGEMBANGAN GAME', 3, 5, '2019', 'Kelas Laboratorium');
INSERT INTO `matakuliah` VALUES ('TI19KS63', 'TI-S1', 'SISTEM INFORMASI GEOGRAFIS', 3, 6, '2019', 'Kelas Laboratorium');
INSERT INTO `matakuliah` VALUES ('TI19KS65', 'TI-S1', 'FINANCE TECHNOLOGY', 3, 6, '2019', 'Kelas');
INSERT INTO `matakuliah` VALUES ('TI19PB61', 'TI-S1', 'PRAKTEK KERJA INDUSTRI/USAHA', 3, 6, '2019', 'Non-Pertemuan');
INSERT INTO `matakuliah` VALUES ('TI19PB71', 'TI-S1', 'TUGAS KHUSUS', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19PB72', 'TI-S1', 'PRA TUGAS AKHIR', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19PB81', 'TI-S1', 'TUGAS AKHIR', NULL, NULL, NULL, NULL);
INSERT INTO `matakuliah` VALUES ('TI19PK81', 'TI-S1', 'BAHASA INGGRIS II', 2, 8, '2019', 'Kelas');

-- ----------------------------
-- Table structure for pengampu
-- ----------------------------
DROP TABLE IF EXISTS `pengampu`;
CREATE TABLE `pengampu`  (
  `ID_PENGAMPU` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NIP_DOSEN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_PRTMN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PENGAMPU`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengampu
-- ----------------------------
INSERT INTO `pengampu` VALUES ('PGP_0T6exB', '040065', 'PRT_ImVt0h');
INSERT INTO `pengampu` VALUES ('PGP_0Z5H4A', '010038', 'PRT_ZFUNJ0');
INSERT INTO `pengampu` VALUES ('PGP_0ZYB5d', '010175', 'PRT_TaiftL');
INSERT INTO `pengampu` VALUES ('PGP_1wKOpm', '010157', 'PRT_8GQte1');
INSERT INTO `pengampu` VALUES ('PGP_1Zz2Lf', '010001', 'PRT_jifCD5');
INSERT INTO `pengampu` VALUES ('PGP_26CqwR', '040078', 'PRT_C3W19d');
INSERT INTO `pengampu` VALUES ('PGP_2BCgvQ', '010106', 'PRT_JDI3lv');
INSERT INTO `pengampu` VALUES ('PGP_2djqu5', '040016', 'PRT_v1ECl2');
INSERT INTO `pengampu` VALUES ('PGP_2HGTRf', '010106', 'PRT_kcjxUT');
INSERT INTO `pengampu` VALUES ('PGP_2QTGJZ', '010040', 'PRT_rMTI8l');
INSERT INTO `pengampu` VALUES ('PGP_2uBCOx', '010167', 'PRT_1IMztH');
INSERT INTO `pengampu` VALUES ('PGP_31lsFx', '	010197', 'PRT_MDFNJP');
INSERT INTO `pengampu` VALUES ('PGP_3dsNxr', '010175', 'PRT_rdUCnM');
INSERT INTO `pengampu` VALUES ('PGP_4BtP6O', '010167', 'PRT_Cu4bWR');
INSERT INTO `pengampu` VALUES ('PGP_4eL8Wz', '010077', 'PRT_hajKd5');
INSERT INTO `pengampu` VALUES ('PGP_4h7LIl', '010041', 'PRT_2tUYGT');
INSERT INTO `pengampu` VALUES ('PGP_4HqDtV', '010128', 'PRT_mDYw1a');
INSERT INTO `pengampu` VALUES ('PGP_4iHwjz', '010063', 'PRT_ei6E27');
INSERT INTO `pengampu` VALUES ('PGP_4Phtr5', '010081', 'PRT_nTiyHC');
INSERT INTO `pengampu` VALUES ('PGP_52JsQ1', '010167', 'PRT_EleUnq');
INSERT INTO `pengampu` VALUES ('PGP_5gQnoA', '010077', 'PRT_oCpReD');
INSERT INTO `pengampu` VALUES ('PGP_5hVt2p', '040065', 'PRT_nzhcNx');
INSERT INTO `pengampu` VALUES ('PGP_5Lv2yf', '010152', 'PRT_bxLH9V');
INSERT INTO `pengampu` VALUES ('PGP_64UdMp', '010004', 'PRT_JI3pgo');
INSERT INTO `pengampu` VALUES ('PGP_6KYmnv', '040063', 'PRT_vNhYtE');
INSERT INTO `pengampu` VALUES ('PGP_6YKpB0', '010167', 'PRT_JOAHsD');
INSERT INTO `pengampu` VALUES ('PGP_73N2gj', '010174', 'PRT_EhKjlJ');
INSERT INTO `pengampu` VALUES ('PGP_7Af3vF', '040065', 'PRT_3QYHj9');
INSERT INTO `pengampu` VALUES ('PGP_7aKu9X', '	010197', 'PRT_ebucCy');
INSERT INTO `pengampu` VALUES ('PGP_7Fz1Op', '010063', 'PRT_e7EnHu');
INSERT INTO `pengampu` VALUES ('PGP_7xaoB4', '010130', 'PRT_9uTQKS');
INSERT INTO `pengampu` VALUES ('PGP_87AkNC', '040065', 'PRT_DNqXgp');
INSERT INTO `pengampu` VALUES ('PGP_8Aq6Dn', '010034', 'PRT_jw3Y80');
INSERT INTO `pengampu` VALUES ('PGP_8cMxhZ', '	010197', 'PRT_RTOCSs');
INSERT INTO `pengampu` VALUES ('PGP_8hHn9t', '010067', 'PRT_hWvC83');
INSERT INTO `pengampu` VALUES ('PGP_8JAitY', '010153', 'PRT_G2jsWz');
INSERT INTO `pengampu` VALUES ('PGP_8KpdyC', '010130', 'PRT_EzH8Uf');
INSERT INTO `pengampu` VALUES ('PGP_8m6UET', '040078', 'PRT_8zyqRl');
INSERT INTO `pengampu` VALUES ('PGP_8vwngz', '010034', 'PRT_7Rflsz');
INSERT INTO `pengampu` VALUES ('PGP_96SuWg', '040063', 'PRT_aofVhR');
INSERT INTO `pengampu` VALUES ('PGP_A1Tfz2', '010078', 'PRT_RDAIOH');
INSERT INTO `pengampu` VALUES ('PGP_A1UxgB', '010034', 'PRT_3sZaYF');
INSERT INTO `pengampu` VALUES ('PGP_A4KPcY', '010052', 'PRT_1uBCYD');
INSERT INTO `pengampu` VALUES ('PGP_A7GSHI', '010045', 'PRT_RuOrws');
INSERT INTO `pengampu` VALUES ('PGP_AEUk1m', '010106', 'PRT_ArHJzv');
INSERT INTO `pengampu` VALUES ('PGP_aFoZ9g', '010153', 'PRT_l4Fy5z');
INSERT INTO `pengampu` VALUES ('PGP_aHe4bx', '040077', 'PRT_Q4IZCh');
INSERT INTO `pengampu` VALUES ('PGP_aoInMl', '010001', 'PRT_CzfU9m');
INSERT INTO `pengampu` VALUES ('PGP_atUMWY', '010052', 'PRT_hFPdOW');
INSERT INTO `pengampu` VALUES ('PGP_auL8bv', '010152', 'PRT_hNHmku');
INSERT INTO `pengampu` VALUES ('PGP_AUOs4L', '010175', 'PRT_QOjlvJ');
INSERT INTO `pengampu` VALUES ('PGP_axHvOL', '010167', 'PRT_vyGS6F');
INSERT INTO `pengampu` VALUES ('PGP_AYx7kw', '010157', 'PRT_7XLVEt');
INSERT INTO `pengampu` VALUES ('PGP_aZ6e1v', '	010197', 'PRT_ah906Q');
INSERT INTO `pengampu` VALUES ('PGP_BHGEaN', '010175', 'PRT_d2hQli');
INSERT INTO `pengampu` VALUES ('PGP_Bi74fh', '010167', 'PRT_FfJtbP');
INSERT INTO `pengampu` VALUES ('PGP_BNSs8z', '040065', 'PRT_Mkxshc');
INSERT INTO `pengampu` VALUES ('PGP_bPLdnw', '010038', 'PRT_O2VaQC');
INSERT INTO `pengampu` VALUES ('PGP_Brq8IY', '010163', 'PRT_xQg5fX');
INSERT INTO `pengampu` VALUES ('PGP_CLaM0d', '040078', 'PRT_cQypiB');
INSERT INTO `pengampu` VALUES ('PGP_CuFkho', '010174', 'PRT_BDl3Mj');
INSERT INTO `pengampu` VALUES ('PGP_CwvpjK', '010040', 'PRT_rWVMjI');
INSERT INTO `pengampu` VALUES ('PGP_CXebQL', '010096', 'PRT_ZLw6IV');
INSERT INTO `pengampu` VALUES ('PGP_CXi9mp', '010152', 'PRT_EGvo2J');
INSERT INTO `pengampu` VALUES ('PGP_CY5Stx', '040077', 'PRT_ruJhLv');
INSERT INTO `pengampu` VALUES ('PGP_D1ekgc', '010158', 'PRT_95V7Bb');
INSERT INTO `pengampu` VALUES ('PGP_dBmswe', '010167', 'PRT_upfOPQ');
INSERT INTO `pengampu` VALUES ('PGP_deK1pY', '010154', 'PRT_euDG7x');
INSERT INTO `pengampu` VALUES ('PGP_DlyTaw', '010081', 'PRT_BVNbWZ');
INSERT INTO `pengampu` VALUES ('PGP_DmcVWo', '010128', 'PRT_Yd9S5i');
INSERT INTO `pengampu` VALUES ('PGP_DrimvL', '040065', 'PRT_jS9Irq');
INSERT INTO `pengampu` VALUES ('PGP_Ec9X4v', '010163', 'PRT_eAjyRK');
INSERT INTO `pengampu` VALUES ('PGP_EeK1C8', '010004', 'PRT_JrwNbV');
INSERT INTO `pengampu` VALUES ('PGP_eFSEqu', '010078', 'PRT_2pnwLv');
INSERT INTO `pengampu` VALUES ('PGP_eGH3EU', '010041', 'PRT_Ur3LuA');
INSERT INTO `pengampu` VALUES ('PGP_ekbwKo', '010154', 'PRT_Dzlb2w');
INSERT INTO `pengampu` VALUES ('PGP_eqlIuT', '040065', 'PRT_Rbu3lz');
INSERT INTO `pengampu` VALUES ('PGP_ES6Lvs', '040016', 'PRT_SImkTL');
INSERT INTO `pengampu` VALUES ('PGP_exdbYn', '040063', 'PRT_60BplA');
INSERT INTO `pengampu` VALUES ('PGP_ExUmky', '010045', 'PRT_vOX1FP');
INSERT INTO `pengampu` VALUES ('PGP_F3VYjq', '010045', 'PRT_lX32Ww');
INSERT INTO `pengampu` VALUES ('PGP_f7NJql', '040065', 'PRT_FIlUeK');
INSERT INTO `pengampu` VALUES ('PGP_fOQA7F', '010175', 'PRT_zD82gC');
INSERT INTO `pengampu` VALUES ('PGP_Fp5LJe', '010152', 'PRT_shAwgP');
INSERT INTO `pengampu` VALUES ('PGP_fQEN8x', '010034', 'PRT_HubfOa');
INSERT INTO `pengampu` VALUES ('PGP_FqM6yU', '040065', 'PRT_J8FtLI');
INSERT INTO `pengampu` VALUES ('PGP_fWaNYu', '010152', 'PRT_Lygxb2');
INSERT INTO `pengampu` VALUES ('PGP_fxAepJ', '010096', 'PRT_M3RNKn');
INSERT INTO `pengampu` VALUES ('PGP_FzXwJY', '010152', 'PRT_o05xs3');
INSERT INTO `pengampu` VALUES ('PGP_g2w5MG', '010078', 'PRT_MqiIOp');
INSERT INTO `pengampu` VALUES ('PGP_gBs5qY', '040078', 'PRT_zJ6AvC');
INSERT INTO `pengampu` VALUES ('PGP_giB8Vc', '040065', 'PRT_AwjrM2');
INSERT INTO `pengampu` VALUES ('PGP_gILeli', '010041', 'PRT_VyBkJp');
INSERT INTO `pengampu` VALUES ('PGP_GKUmTJ', '040077', 'PRT_7cmgkb');
INSERT INTO `pengampu` VALUES ('PGP_HBCXmx', '010130', 'PRT_KR2JBP');
INSERT INTO `pengampu` VALUES ('PGP_HdiXZj', '010067', 'PRT_E1KNsy');
INSERT INTO `pengampu` VALUES ('PGP_hHZPrW', '010040', 'PRT_OyupkQ');
INSERT INTO `pengampu` VALUES ('PGP_HPsrbl', '010174', 'PRT_bzFT4a');
INSERT INTO `pengampu` VALUES ('PGP_HusKT0', '010078', 'PRT_b6NwDG');
INSERT INTO `pengampu` VALUES ('PGP_hvTDky', '010158', 'PRT_a9RpBL');
INSERT INTO `pengampu` VALUES ('PGP_Hxe8NJ', '010041', 'PRT_Im3DQt');
INSERT INTO `pengampu` VALUES ('PGP_IBMbGn', '040065', 'PRT_p3MEvi');
INSERT INTO `pengampu` VALUES ('PGP_iBYHna', '010167', 'PRT_VeoOkG');
INSERT INTO `pengampu` VALUES ('PGP_IlrYOw', '010130', 'PRT_WHCUSp');
INSERT INTO `pengampu` VALUES ('PGP_IryzSR', '010067', 'PRT_P4UyjJ');
INSERT INTO `pengampu` VALUES ('PGP_IsKCSV', '010034', 'PRT_8jISRJ');
INSERT INTO `pengampu` VALUES ('PGP_Ja01Yk', '010163', 'PRT_yatQ8n');
INSERT INTO `pengampu` VALUES ('PGP_JAbuvx', '010174', 'PRT_s20dwF');
INSERT INTO `pengampu` VALUES ('PGP_jB34No', '040086', 'PRT_9gWTH8');
INSERT INTO `pengampu` VALUES ('PGP_jbr3mX', '010158', 'PRT_vAOIb1');
INSERT INTO `pengampu` VALUES ('PGP_JLgbMw', '010130', 'PRT_qjwmDr');
INSERT INTO `pengampu` VALUES ('PGP_JlNIbg', '010167', 'PRT_ny23TF');
INSERT INTO `pengampu` VALUES ('PGP_jNilf4', '010045', 'PRT_9YhTFq');
INSERT INTO `pengampu` VALUES ('PGP_JoZS5q', '010167', 'PRT_WOJsAx');
INSERT INTO `pengampu` VALUES ('PGP_JQzhsU', '010038', 'PRT_K1SgFx');
INSERT INTO `pengampu` VALUES ('PGP_JR2X3Q', '010034', 'PRT_SlTU9C');
INSERT INTO `pengampu` VALUES ('PGP_jtIwpo', '010130', 'PRT_JdD5Ve');
INSERT INTO `pengampu` VALUES ('PGP_KbBPkw', '010128', 'PRT_XYbpEy');
INSERT INTO `pengampu` VALUES ('PGP_KlLXOA', '010096', 'PRT_lE87Tv');
INSERT INTO `pengampu` VALUES ('PGP_kloFE2', '010130', 'PRT_6wHSQC');
INSERT INTO `pengampu` VALUES ('PGP_KSNxu8', '010045', 'PRT_chuO0L');
INSERT INTO `pengampu` VALUES ('PGP_KToJwU', '010128', 'PRT_vOz4rU');
INSERT INTO `pengampu` VALUES ('PGP_lcSF7z', '010063', 'PRT_MDkg1K');
INSERT INTO `pengampu` VALUES ('PGP_lHOsq7', '010130', 'PRT_k5tlrz');
INSERT INTO `pengampu` VALUES ('PGP_LudFRn', '010034', 'PRT_zk4EGF');
INSERT INTO `pengampu` VALUES ('PGP_lvSJmP', '010130', 'PRT_jd49Dt');
INSERT INTO `pengampu` VALUES ('PGP_LxObks', '010154', 'PRT_c2ACIZ');
INSERT INTO `pengampu` VALUES ('PGP_LzwE8G', '010081', 'PRT_ZGILPF');
INSERT INTO `pengampu` VALUES ('PGP_mlTBS1', '010106', 'PRT_7dIZat');
INSERT INTO `pengampu` VALUES ('PGP_mqvKCf', '010081', 'PRT_KhEc3o');
INSERT INTO `pengampu` VALUES ('PGP_Mrkcwj', '040077', 'PRT_CeDvlA');
INSERT INTO `pengampu` VALUES ('PGP_mvALwe', '010034', 'PRT_omPEsi');
INSERT INTO `pengampu` VALUES ('PGP_n6Iuwa', '010050', 'PRT_OYiekw');
INSERT INTO `pengampu` VALUES ('PGP_nEyZgb', '010063', 'PRT_5NzQCE');
INSERT INTO `pengampu` VALUES ('PGP_nHgBeE', '010034', 'PRT_QMaKUz');
INSERT INTO `pengampu` VALUES ('PGP_nIO37U', '010034', 'PRT_nwt8sk');
INSERT INTO `pengampu` VALUES ('PGP_NQ9wdf', '010045', 'PRT_nyRs2M');
INSERT INTO `pengampu` VALUES ('PGP_nU6YDO', '010167', 'PRT_Yqobm8');
INSERT INTO `pengampu` VALUES ('PGP_Nzv9AM', '010157', 'PRT_p2T5ki');
INSERT INTO `pengampu` VALUES ('PGP_o6jTEW', '010106', 'PRT_NRlmDM');
INSERT INTO `pengampu` VALUES ('PGP_oEAB0G', '040063', 'PRT_P01N5u');
INSERT INTO `pengampu` VALUES ('PGP_OGwX0y', '040065', 'PRT_Q0YIbf');
INSERT INTO `pengampu` VALUES ('PGP_ohjY1U', '010157', 'PRT_RsP49p');
INSERT INTO `pengampu` VALUES ('PGP_oKhvuQ', '010004', 'PRT_aK1wTm');
INSERT INTO `pengampu` VALUES ('PGP_Ovpbl3', '010174', 'PRT_fvWkn7');
INSERT INTO `pengampu` VALUES ('PGP_Pb8AU2', '040065', 'PRT_jLhAXJ');
INSERT INTO `pengampu` VALUES ('PGP_pdg8BC', '010154', 'PRT_0OtB5f');
INSERT INTO `pengampu` VALUES ('PGP_pDknX1', '010174', 'PRT_URQqPG');
INSERT INTO `pengampu` VALUES ('PGP_pGSKFW', '010175', 'PRT_3bc1Il');
INSERT INTO `pengampu` VALUES ('PGP_PKVuTp', '010040', 'PRT_DiNI01');
INSERT INTO `pengampu` VALUES ('PGP_plvaL7', '010081', 'PRT_ZhgYzO');
INSERT INTO `pengampu` VALUES ('PGP_PoqOUn', '010001', 'PRT_x0DI2V');
INSERT INTO `pengampu` VALUES ('PGP_PStdlO', '040065', 'PRT_XVb7yW');
INSERT INTO `pengampu` VALUES ('PGP_PTkrYg', '010096', 'PRT_1bWwfx');
INSERT INTO `pengampu` VALUES ('PGP_PUpM8x', '010130', 'PRT_KbsIoy');
INSERT INTO `pengampu` VALUES ('PGP_PwrRoA', '040063', 'PRT_08Imkt');
INSERT INTO `pengampu` VALUES ('PGP_PzlYbr', '040086', 'PRT_oxytCa');
INSERT INTO `pengampu` VALUES ('PGP_q146ir', '010045', 'PRT_AQfphM');
INSERT INTO `pengampu` VALUES ('PGP_QbeTWZ', '010050', 'PRT_If59sQ');
INSERT INTO `pengampu` VALUES ('PGP_QFL0Kw', '010040', 'PRT_IXmPKs');
INSERT INTO `pengampu` VALUES ('PGP_qgLajC', '010130', 'PRT_YKRbPc');
INSERT INTO `pengampu` VALUES ('PGP_Qk2j8t', '040016', 'PRT_eh87O4');
INSERT INTO `pengampu` VALUES ('PGP_qnNTBU', '010096', 'PRT_s1vyBL');
INSERT INTO `pengampu` VALUES ('PGP_qTJpcg', '010174', 'PRT_x4K0s6');
INSERT INTO `pengampu` VALUES ('PGP_QuRcgl', '	010197', 'PRT_dhtK4H');
INSERT INTO `pengampu` VALUES ('PGP_QXWOBp', '010175', 'PRT_SbNlJf');
INSERT INTO `pengampu` VALUES ('PGP_r2eCWp', '040063', 'PRT_EbDwxM');
INSERT INTO `pengampu` VALUES ('PGP_R38cx4', '010153', 'PRT_qFJHIB');
INSERT INTO `pengampu` VALUES ('PGP_rA0Zxg', '040016', 'PRT_rtePgB');
INSERT INTO `pengampu` VALUES ('PGP_RDiP1V', '010153', 'PRT_ED72NR');
INSERT INTO `pengampu` VALUES ('PGP_rhV83R', '010067', 'PRT_7dOcml');
INSERT INTO `pengampu` VALUES ('PGP_Rpx3zg', '010001', 'PRT_omUITS');
INSERT INTO `pengampu` VALUES ('PGP_Rx5voO', '010130', 'PRT_duatyv');
INSERT INTO `pengampu` VALUES ('PGP_rXK8Fk', '010034', 'PRT_TcS9Wu');
INSERT INTO `pengampu` VALUES ('PGP_rxYH3t', '040078', 'PRT_TK32f0');
INSERT INTO `pengampu` VALUES ('PGP_s20KRV', '040063', 'PRT_5nCPch');
INSERT INTO `pengampu` VALUES ('PGP_S836xW', '040063', 'PRT_qN82Ek');
INSERT INTO `pengampu` VALUES ('PGP_s8ZBok', '010034', 'PRT_0YbQJm');
INSERT INTO `pengampu` VALUES ('PGP_sAfMjw', '010078', 'PRT_9GiMKj');
INSERT INTO `pengampu` VALUES ('PGP_sF1qt8', '010167', 'PRT_KHR1gX');
INSERT INTO `pengampu` VALUES ('PGP_SGtqRM', '040065', 'PRT_4YFMrn');
INSERT INTO `pengampu` VALUES ('PGP_sIWJO1', '010081', 'PRT_Y9Mm8o');
INSERT INTO `pengampu` VALUES ('PGP_SLGPno', '010081', 'PRT_nUBx53');
INSERT INTO `pengampu` VALUES ('PGP_SLwjEx', '040077', 'PRT_5ArFCs');
INSERT INTO `pengampu` VALUES ('PGP_sPQK0n', '010078', 'PRT_SIMu2k');
INSERT INTO `pengampu` VALUES ('PGP_sribE1', '010163', 'PRT_8oYiwk');
INSERT INTO `pengampu` VALUES ('PGP_Stj4pf', '010038', 'PRT_4cuVTq');
INSERT INTO `pengampu` VALUES ('PGP_svhXik', '010096', 'PRT_yJW5kf');
INSERT INTO `pengampu` VALUES ('PGP_t4YCZE', '010034', 'PRT_A97cQK');
INSERT INTO `pengampu` VALUES ('PGP_tBMEOJ', '010158', 'PRT_PwJeos');
INSERT INTO `pengampu` VALUES ('PGP_tcmEB4', '040016', 'PRT_LQYzWf');
INSERT INTO `pengampu` VALUES ('PGP_TJI8cL', '010163', 'PRT_5HUryF');
INSERT INTO `pengampu` VALUES ('PGP_tOJp1a', '010174', 'PRT_xHn1B0');
INSERT INTO `pengampu` VALUES ('PGP_tR3Lnu', '010158', 'PRT_OtN0en');
INSERT INTO `pengampu` VALUES ('PGP_ts93e4', '010045', 'PRT_obcHtf');
INSERT INTO `pengampu` VALUES ('PGP_tv2BHX', '010135', 'PRT_QJAsaD');
INSERT INTO `pengampu` VALUES ('PGP_tZ58mQ', '010130', 'PRT_TLOVuq');
INSERT INTO `pengampu` VALUES ('PGP_ufFqk1', '010130', 'PRT_0VAlHg');
INSERT INTO `pengampu` VALUES ('PGP_uGIDlp', '010034', 'PRT_AJ5LlM');
INSERT INTO `pengampu` VALUES ('PGP_uhUy5x', '010040', 'PRT_aSMcmv');
INSERT INTO `pengampu` VALUES ('PGP_Ui0vZy', '010174', 'PRT_zvm9o0');
INSERT INTO `pengampu` VALUES ('PGP_Umj5bK', '010128', 'PRT_lRFV4h');
INSERT INTO `pengampu` VALUES ('PGP_UNMK8f', '010040', 'PRT_5gIS8V');
INSERT INTO `pengampu` VALUES ('PGP_uTVJ7t', '010152', 'PRT_eqrAid');
INSERT INTO `pengampu` VALUES ('PGP_UuAXF4', '040016', 'PRT_jYCtc0');
INSERT INTO `pengampu` VALUES ('PGP_UvcP3F', '010034', 'PRT_37jcfe');
INSERT INTO `pengampu` VALUES ('PGP_v2GSb7', '010040', 'PRT_oOl2zZ');
INSERT INTO `pengampu` VALUES ('PGP_VEeXd9', '040086', 'PRT_rW5Ol1');
INSERT INTO `pengampu` VALUES ('PGP_vJscXn', '010040', 'PRT_gBkZAt');
INSERT INTO `pengampu` VALUES ('PGP_vpGUV2', '010175', 'PRT_dNjqPx');
INSERT INTO `pengampu` VALUES ('PGP_VtHjhI', '010130', 'PRT_yG2mMp');
INSERT INTO `pengampu` VALUES ('PGP_vZ13n9', '010040', 'PRT_lK6QDE');
INSERT INTO `pengampu` VALUES ('PGP_vZJ5W7', '010130', 'PRT_JLV0MF');
INSERT INTO `pengampu` VALUES ('PGP_W9zvt7', '010096', 'PRT_VGE12Z');
INSERT INTO `pengampu` VALUES ('PGP_wCGiIF', '010034', 'PRT_voAZHi');
INSERT INTO `pengampu` VALUES ('PGP_wNS7Al', '010041', 'PRT_iUhkKL');
INSERT INTO `pengampu` VALUES ('PGP_wrgD5L', '040016', 'PRT_s7Cr1e');
INSERT INTO `pengampu` VALUES ('PGP_wTy9sQ', '010040', 'PRT_oAJWwe');
INSERT INTO `pengampu` VALUES ('PGP_WUMT3Y', '040065', 'PRT_HAZqS7');
INSERT INTO `pengampu` VALUES ('PGP_wVetuN', '010041', 'PRT_yiLEcM');
INSERT INTO `pengampu` VALUES ('PGP_x1Yoi9', '010175', 'PRT_mneA9G');
INSERT INTO `pengampu` VALUES ('PGP_XDLGqb', '010038', 'PRT_x48CH6');
INSERT INTO `pengampu` VALUES ('PGP_XjxW1q', '010045', 'PRT_9CSoxV');
INSERT INTO `pengampu` VALUES ('PGP_XkW2fL', '040063', 'PRT_Mg89qI');
INSERT INTO `pengampu` VALUES ('PGP_XLn7V1', '010154', 'PRT_XYmZ96');
INSERT INTO `pengampu` VALUES ('PGP_xoKbUd', '010135', 'PRT_1USCLN');
INSERT INTO `pengampu` VALUES ('PGP_xpfOB9', '010045', 'PRT_xCH92j');
INSERT INTO `pengampu` VALUES ('PGP_xYpLrk', '010081', 'PRT_5gy0pF');
INSERT INTO `pengampu` VALUES ('PGP_y1lunT', '010052', 'PRT_nrPQfU');
INSERT INTO `pengampu` VALUES ('PGP_Y8QdNu', '040065', 'PRT_bdY9qy');
INSERT INTO `pengampu` VALUES ('PGP_YB0VqQ', '010040', 'PRT_Bmjo0x');
INSERT INTO `pengampu` VALUES ('PGP_YhS4V5', '010163', 'PRT_dUwmcH');
INSERT INTO `pengampu` VALUES ('PGP_YLh5VR', '010078', 'PRT_Q7tbpe');
INSERT INTO `pengampu` VALUES ('PGP_yPb3sF', '010040', 'PRT_9PIjAQ');
INSERT INTO `pengampu` VALUES ('PGP_YPSX7F', '010175', 'PRT_JelnUz');
INSERT INTO `pengampu` VALUES ('PGP_yrhFaY', '010153', 'PRT_8veKCS');
INSERT INTO `pengampu` VALUES ('PGP_YTmyf3', '040065', 'PRT_tz24YA');
INSERT INTO `pengampu` VALUES ('PGP_YX4d3u', '010175', 'PRT_2ij4Ab');
INSERT INTO `pengampu` VALUES ('PGP_YX8VKN', '010081', 'PRT_xdrCTH');
INSERT INTO `pengampu` VALUES ('PGP_zGMnBd', '040086', 'PRT_dvY29l');
INSERT INTO `pengampu` VALUES ('PGP_zHqkBr', '010001', 'PRT_ZwFEkL');
INSERT INTO `pengampu` VALUES ('PGP_zI1wpV', '010158', 'PRT_Rosztm');
INSERT INTO `pengampu` VALUES ('PGP_zj3LPH', '010077', 'PRT_wWkYzd');
INSERT INTO `pengampu` VALUES ('PGP_zjDvlq', '010153', 'PRT_FPaxUe');
INSERT INTO `pengampu` VALUES ('PGP_zlcG4Q', '010174', 'PRT_l2JHGr');
INSERT INTO `pengampu` VALUES ('PGP_Zvh8mG', '010045', 'PRT_4M3BTX');
INSERT INTO `pengampu` VALUES ('PGP_zxQEk7', '010034', 'PRT_L5xmD3');

-- ----------------------------
-- Table structure for pertemuan
-- ----------------------------
DROP TABLE IF EXISTS `pertemuan`;
CREATE TABLE `pertemuan`  (
  `ID_PRTMN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KODE_MATKUL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KELAS_PRTMN` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RUANG_PRTMN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PRTMN`) USING BTREE,
  INDEX `FK_REFERENCE_10`(`KODE_MATKUL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pertemuan
-- ----------------------------
INSERT INTO `pertemuan` VALUES ('PRT_08Imkt', 'DK19KB62', 'D4', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_0OtB5f', 'TI19KD51', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_0VAlHg', 'TI14PB71', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_0YbQJm', 'TI19KB51', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_1bWwfx', 'SI19KK26', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_1IMztH', 'DK19PK22', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_1uBCYD', 'TI19KK64', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_1USCLN', 'MU21PK61', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_2ij4Ab', 'TI19KL52', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_2pnwLv', 'MU21PK81', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_2tUYGT', 'TI19KB22', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_37jcfe', 'TI19KK22', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_3bc1Il', 'DK19PK41', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_3QYHj9', 'DK19KB62', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_3sZaYF', 'MI16PB62', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_4cuVTq', 'TI19KB43', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_4M3BTX', 'SI19KK24', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_4YFMrn', 'DK19KB62', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_5ArFCs', 'MI14KK41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_5gIS8V', 'MI20KB45', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_5gy0pF', 'DK19KK41', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_5HUryF', 'TI19KS65', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_5nCPch', 'DK19KB61', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_5NzQCE', 'TI19KB43', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_60BplA', 'DK19KB61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_6wHSQC', 'TI19PB71', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_7cmgkb', 'MU21PK62', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_7dIZat', 'SI19KK41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_7dOcml', 'MI16KB41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_7Rflsz', 'MI14KK22', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_7XLVEt', 'DK19KK22', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_8GQte1', 'DK19PK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_8jISRJ', 'MI20KB41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_8oYiwk', 'MU21KB51', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_8veKCS', 'DK19KB64', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_8zyqRl', 'TI19KK41', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_95V7Bb', 'DK19KB65', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_9CSoxV', 'TI19KB21', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_9GiMKj', 'MU21BB31', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_9gWTH8', 'DK19PK21', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_9PIjAQ', 'DK19KK41', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_9uTQKS', 'TI19PB61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_9YhTFq', 'TI19KB21', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_A97cQK', 'SI15KK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_a9RpBL', 'DK19KB21', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ah906Q', 'TI19KK62', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_AJ5LlM', 'MI14KK22', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_aK1wTm', 'MU21PK65', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_aofVhR', 'DK19PK42', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_AQfphM', 'MI20KB21', 'D4', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ArHJzv', 'SI19KB43', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_aSMcmv', 'TI19KK24', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_AwjrM2', 'MI20KB51', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_b6NwDG', 'MI14PK61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_BDl3Mj', 'MI14KB43', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_bdY9qy', 'TI19KB41', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Bmjo0x', 'DK19KK41', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_BVNbWZ', 'DK19KK41', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_bxLH9V', 'SI19KK23', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_bzFT4a', 'TI19KK62', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_c2ACIZ', 'TI19KK23', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_C3W19d', 'TI19KK41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_CeDvlA', 'MU21PK62', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_chuO0L', 'MI20KB21', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_cQypiB', 'MU21KK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Cu4bWR', 'DK19KK22', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_CzfU9m', 'MI14KK22', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_d2hQli', 'MI14KB44', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_dhtK4H', 'TI19KB22', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_DiNI01', 'SI19KB44', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_dNjqPx', 'MI16BB51', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_DNqXgp', 'TI19KB22', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_duatyv', 'MU21KB51', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_dUwmcH', 'TI19KB44', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_dvY29l', 'DK19PK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Dzlb2w', 'MI14KK23', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_E1KNsy', 'SI19KB46', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_e7EnHu', 'TI19KD51', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_eAjyRK', 'SI19KK22', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_EbDwxM', 'DK19PK42', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ebucCy', 'TI19KB42', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ED72NR', 'DK19KK23', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_EGvo2J', 'SI15KK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_eh87O4', 'TI19KK63', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_EhKjlJ', 'MI20KB45', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ei6E27', 'SI19KB61', 'L', 'B.2.3');
INSERT INTO `pertemuan` VALUES ('PRT_EleUnq', 'DK19PB71', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_eqrAid', 'MI14KK22', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_euDG7x', 'TI19KK23', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_EzH8Uf', 'SI19KK27', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_FfJtbP', 'DK19KK22', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_FIlUeK', 'TI19KB41', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_FPaxUe', 'DK19KB64', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_fvWkn7', 'MI20KB45', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_G2jsWz', 'DK19KK44', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_gBkZAt', 'SI19KB44', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_hajKd5', 'TI19KS63', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_HAZqS7', 'DK19KB62', 'D4', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_hFPdOW', 'MI14KB55', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_hNHmku', 'SI19KK23', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_HubfOa', 'SI19PB81', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_hWvC83', 'TI19KB44', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_If59sQ', 'SI19KB62', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Im3DQt', 'TI19KB22', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ImVt0h', 'MI20KB51', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_iUhkKL', 'MI14KB22', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_IXmPKs', 'TI19KB42', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_J8FtLI', 'TI19KB41', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_jd49Dt', 'TI19PB72', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_JdD5Ve', 'TI19PB81', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_JDI3lv', 'SI19KB53', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_JelnUz', 'DK19PK61', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_JI3pgo', 'MU21PK65', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_jifCD5', 'SI15KK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_jLhAXJ', 'MI20KB51', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_JLV0MF', 'TI19PB61', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_JOAHsD', 'DK19PB61', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_JrwNbV', 'TI19KK23', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_jS9Irq', 'TI19KB41', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_jw3Y80', 'SI15PB81', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_jYCtc0', 'SI19KK41', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_K1SgFx', 'MU21KK61', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_k5tlrz', 'SI19KK42', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_KbsIoy', 'TI19PB72', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_kcjxUT', 'TI19KL52', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_KhEc3o', 'DK19KK41', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_KHR1gX', 'DK19KB41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_KR2JBP', 'TI14PB81', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_l2JHGr', 'MI14KB52', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_l4Fy5z', 'DK19KK44', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_L5xmD3', 'SI19KK21', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_lE87Tv', 'SI19KK26', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_lK6QDE', 'DK19KK41', 'D4', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_LQYzWf', 'KM21KB01', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_lRFV4h', 'TI19KK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_lX32Ww', 'MI20KB21', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Lygxb2', 'SI19KB42', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_M3RNKn', 'MU21BB21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_MDFNJP', 'TI19KK24', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_MDkg1K', 'TI19KB43', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_mDYw1a', 'MU21KK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Mg89qI', 'DK19KB62', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Mkxshc', 'MI14KB22', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_mneA9G', 'SI19KB43', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_MqiIOp', 'MU21PK81', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_NRlmDM', 'DK19PK41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_nrPQfU', 'TI19KK64', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_nTiyHC', 'TI19KS51', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_nUBx53', 'DK19KK42', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_nwt8sk', 'MI14PB61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ny23TF', 'DK19KB41', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_nyRs2M', 'TI19KB21', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_nzhcNx', 'TI19KB41', 'D4', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_o05xs3', 'SI19KB42', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_O2VaQC', 'TI19KN63', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_oAJWwe', 'MI20KB45', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_obcHtf', 'TI19KB21', 'D4', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_oCpReD', 'TI19KS51', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_omPEsi', 'SI19PB61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_omUITS', 'SI19BB83', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_oOl2zZ', 'MI20KB45', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_OtN0en', 'DK19KK43', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_oxytCa', 'DK19KK23', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_OYiekw', 'TI19KS51', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_OyupkQ', 'TI19KB42', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_P01N5u', 'DK19KB62', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_p2T5ki', 'DK19KK22', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_p3MEvi', 'TI19KB41', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_P4UyjJ', 'TI19KK22', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_PwJeos', 'DK19KB21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Q0YIbf', 'TI19KB22', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Q4IZCh', 'MI14KK41', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Q7tbpe', 'MU21PK11', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_qFJHIB', 'DK19KK23', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_QJAsaD', 'MU21PK61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_qjwmDr', 'TI19PB81', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_QMaKUz', 'MI14PB51', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_qN82Ek', 'DK19KB62', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_QOjlvJ', 'SI19KK27', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Rbu3lz', 'DK19KB62', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_RDAIOH', 'MU21PK11', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_rdUCnM', 'DK19PK61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_rMTI8l', 'DK19KK41', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Rosztm', 'DK19KK43', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_RsP49p', 'DK19KK21', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_rtePgB', 'TI19KK63', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_RTOCSs', 'TI19KB44', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ruJhLv', 'MU21BB21', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_RuOrws', 'SI19KK24', 'D4', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_rW5Ol1', 'DK19PK42', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_rWVMjI', 'SI19KB44', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_s1vyBL', 'MU21KB41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_s20dwF', 'TI19KB42', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_s7Cr1e', 'TI19KD63', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_SbNlJf', 'TI19BB71', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_shAwgP', 'TI19KK22', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_SImkTL', 'TI19KK63', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_SIMu2k', 'TI19PK81', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_SlTU9C', 'TI19KK22', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_TaiftL', 'SI19KB63', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_TcS9Wu', 'MI14KB46', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_TK32f0', 'MU21KK21', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_TLOVuq', 'MU21KB51', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_tz24YA', 'TI19KK52', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_upfOPQ', 'DK19PB61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Ur3LuA', 'TI19KB22', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_URQqPG', 'TI19KK62', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_v1ECl2', 'SI19KK41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_vAOIb1', 'DK19KB65', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_VeoOkG', 'DK19PB81', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_VGE12Z', 'MI14KK31', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_vNhYtE', 'DK19KB62', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_voAZHi', 'SI19PB72', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_vOX1FP', 'MI20KB21', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_vOz4rU', 'TI19KK21', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_VyBkJp', 'TI19KN61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_vyGS6F', 'DK19PB72', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_WHCUSp', 'TI19PB71', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_WOJsAx', 'DK14PB81', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_wWkYzd', 'TI19KS63', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_x0DI2V', 'TI19KK22', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_x48CH6', 'MU21KK61', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_x4K0s6', 'SI19KB44', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_xCH92j', 'MI20KB21', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_xdrCTH', 'DK19KK41', 'D4', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_xHn1B0', 'SI19KB44', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_xQg5fX', 'SI19KK22', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_XVb7yW', 'TI19KB22', 'D3', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_XYbpEy', 'TI19KK21', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_XYmZ96', 'SI19KB61', 'L', 'B.2.3');
INSERT INTO `pertemuan` VALUES ('PRT_Y9Mm8o', 'DK19KK21', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_yatQ8n', 'TI19KB44', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Yd9S5i', 'MU21KK21', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_yG2mMp', 'TI14PB81', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_yiLEcM', 'TI19KB22', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_yJW5kf', 'MU21KB41', 'P2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_YKRbPc', 'MU21KB51', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_Yqobm8', 'DK19KK22', 'D2', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_zD82gC', 'SI19BB83', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ZFUNJ0', 'TI19KN63', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ZGILPF', 'DK19KK41', 'D1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ZhgYzO', 'DK19KK42', 'P', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_zJ6AvC', 'TI19KK41', 'P1', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_zk4EGF', 'SI19PB71', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ZLw6IV', 'SI19BB82', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_zvm9o0', 'MI16KB41', 'D', 'DARING');
INSERT INTO `pertemuan` VALUES ('PRT_ZwFEkL', 'DK19PK61', 'D', 'DARING');

-- ----------------------------
-- Table structure for perwalian
-- ----------------------------
DROP TABLE IF EXISTS `perwalian`;
CREATE TABLE `perwalian`  (
  `ID_PERWALIAN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_JADWAL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NRP_MHS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PERWALIAN`) USING BTREE,
  INDEX `FK_REFERENCE_13`(`ID_JADWAL`) USING BTREE,
  INDEX `FK_REFERENCE_14`(`NRP_MHS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of perwalian
-- ----------------------------
INSERT INTO `perwalian` VALUES ('PWL_0cSsaoNzfZbC', 'JDW_9VX4ND', '191116016');
INSERT INTO `perwalian` VALUES ('PWL_0Z6OBmtLjNQU', 'JDW_CzAn8u', '181111085');
INSERT INTO `perwalian` VALUES ('PWL_1mzBVjr4UEt3', 'JDW_YWEMtS', '181111059');
INSERT INTO `perwalian` VALUES ('PWL_1Ui8gtB9RbXk', 'JDW_YWEMtS', '191111060');
INSERT INTO `perwalian` VALUES ('PWL_1zTMFAIgCVjZ', 'JDW_YWEMtS', '171221014');
INSERT INTO `perwalian` VALUES ('PWL_1zwk4JDgNuxA', 'JDW_YWEMtS', '191111020');
INSERT INTO `perwalian` VALUES ('PWL_3ABt5PaJdFQc', 'JDW_YWEMtS', '181111087');
INSERT INTO `perwalian` VALUES ('PWL_3CvEO2K8mJFU', 'JDW_YWEMtS', '191111047');
INSERT INTO `perwalian` VALUES ('PWL_3qNz8GEWdrk9', 'JDW_YWEMtS', '181111007');
INSERT INTO `perwalian` VALUES ('PWL_4capBhvMklHz', 'JDW_UOAvFj', '201136006');
INSERT INTO `perwalian` VALUES ('PWL_4CUHuh7k6eLz', 'JDW_YWEMtS', '181111028');
INSERT INTO `perwalian` VALUES ('PWL_4eWaGdzlJDxV', 'JDW_YWEMtS', '181111085');
INSERT INTO `perwalian` VALUES ('PWL_4JLfGZoNYj3B', 'JDW_CzAn8u', '181111076');
INSERT INTO `perwalian` VALUES ('PWL_4lbavOehfD3w', 'JDW_YWEMtS', '191111009');
INSERT INTO `perwalian` VALUES ('PWL_4u2FpigHWAd1', 'JDW_YWEMtS', '191111036');
INSERT INTO `perwalian` VALUES ('PWL_50CdkL6bW7ew', 'JDW_YWEMtS', '191111007');
INSERT INTO `perwalian` VALUES ('PWL_5jJPdIu1m3tQ', 'JDW_9VX4ND', '191116009');
INSERT INTO `perwalian` VALUES ('PWL_5sXurYQaCGlM', 'JDW_YWEMtS', '191111035');
INSERT INTO `perwalian` VALUES ('PWL_5WbA1uLpwf4E', 'JDW_YWEMtS', '191221012');
INSERT INTO `perwalian` VALUES ('PWL_6bQUzmNXlqHZ', 'JDW_YWEMtS', '181111068');
INSERT INTO `perwalian` VALUES ('PWL_6Mew5Lmz4Za1', 'JDW_CzAn8u', '191111036');
INSERT INTO `perwalian` VALUES ('PWL_6RUGgSt0xcEu', 'JDW_YWEMtS', '181111094');
INSERT INTO `perwalian` VALUES ('PWL_6w5PukRGhMKt', 'JDW_P8uUNA', '201131003');
INSERT INTO `perwalian` VALUES ('PWL_7JQXd0U5jFkK', 'JDW_9VX4ND', '171116009');
INSERT INTO `perwalian` VALUES ('PWL_7jvS0ncwg8Fi', 'JDW_P8uUNA', '201131004');
INSERT INTO `perwalian` VALUES ('PWL_7nwCa5lUv2Eb', 'JDW_YWEMtS', '191111055');
INSERT INTO `perwalian` VALUES ('PWL_7VP0ep31nQqk', 'JDW_YWEMtS', '181111063');
INSERT INTO `perwalian` VALUES ('PWL_7YOtwcVdSv2k', 'JDW_YWEMtS', '191111021');
INSERT INTO `perwalian` VALUES ('PWL_7YP3raXM9BJh', 'JDW_YWEMtS', '181111078');
INSERT INTO `perwalian` VALUES ('PWL_8DPCLu62msIy', 'JDW_CzAn8u', '141111071');
INSERT INTO `perwalian` VALUES ('PWL_8hkHof2z74gG', 'JDW_CzAn8u', '171111003');
INSERT INTO `perwalian` VALUES ('PWL_93V1FcMKgrWz', 'JDW_CzAn8u', '191111062');
INSERT INTO `perwalian` VALUES ('PWL_9rvxqAEk6OR0', 'JDW_CzAn8u', '181111057');
INSERT INTO `perwalian` VALUES ('PWL_9TRvq4c12kyu', 'JDW_UOAvFj', '201136005');
INSERT INTO `perwalian` VALUES ('PWL_a4DdkK9Mgt0v', 'JDW_YWEMtS', '191221009');
INSERT INTO `perwalian` VALUES ('PWL_Aa5uW81FDiBC', 'JDW_YWEMtS', '181111062');
INSERT INTO `perwalian` VALUES ('PWL_aAb4zDpYyVW2', 'JDW_P8uUNA', '201131005');
INSERT INTO `perwalian` VALUES ('PWL_aD1REjrBIS2y', 'JDW_9VX4ND', '191116017');
INSERT INTO `perwalian` VALUES ('PWL_aiBKLQTVCnzg', 'JDW_YWEMtS', '181111015');
INSERT INTO `perwalian` VALUES ('PWL_aioP26qvA5kG', 'JDW_YWEMtS', '191111012');
INSERT INTO `perwalian` VALUES ('PWL_AMZ1Gmb9RrUa', 'JDW_CzAn8u', '191111048');
INSERT INTO `perwalian` VALUES ('PWL_aOIDkSTqx5Bl', 'JDW_YWEMtS', '191221003');
INSERT INTO `perwalian` VALUES ('PWL_ArW3oD8Hlg5E', 'JDW_9VX4ND', '191116003');
INSERT INTO `perwalian` VALUES ('PWL_AUdGz9sZRpx1', 'JDW_YWEMtS', '181111082');
INSERT INTO `perwalian` VALUES ('PWL_AYjyawbS2O9u', 'JDW_YWEMtS', '191111024');
INSERT INTO `perwalian` VALUES ('PWL_BGf2Da3Q4eig', 'JDW_YWEMtS', '181111069');
INSERT INTO `perwalian` VALUES ('PWL_bMylAaxLBvcO', 'JDW_CzAn8u', '191111017');
INSERT INTO `perwalian` VALUES ('PWL_BNpuLaKxIYoU', 'JDW_CzAn8u', '181111107');
INSERT INTO `perwalian` VALUES ('PWL_Bqt5KZVAokyT', 'JDW_YWEMtS', '191111052');
INSERT INTO `perwalian` VALUES ('PWL_CD2s6XmjGfbd', 'JDW_CzAn8u', '181111005');
INSERT INTO `perwalian` VALUES ('PWL_CDSpRh2P1Avu', 'JDW_CzAn8u', '191111002');
INSERT INTO `perwalian` VALUES ('PWL_CFN68BbSdcPl', 'JDW_9VX4ND', '181116011');
INSERT INTO `perwalian` VALUES ('PWL_CFSs2rUIiOc6', 'JDW_YWEMtS', '181111037');
INSERT INTO `perwalian` VALUES ('PWL_cFzLdsiUOW3Q', 'JDW_P8uUNA', '201131006');
INSERT INTO `perwalian` VALUES ('PWL_CiD9qtFjNPRa', 'JDW_YWEMtS', '191111026');
INSERT INTO `perwalian` VALUES ('PWL_cJohD1bKLAY0', 'JDW_YWEMtS', '181111096');
INSERT INTO `perwalian` VALUES ('PWL_ck8SnBEbfTNt', 'JDW_YWEMtS', '181111067');
INSERT INTO `perwalian` VALUES ('PWL_DAiR21qgdTpX', 'JDW_YWEMtS', '191111039');
INSERT INTO `perwalian` VALUES ('PWL_dBlgwNmIFCKy', 'JDW_P8uUNA', '201131007');
INSERT INTO `perwalian` VALUES ('PWL_dExcu8PbHJtg', 'JDW_YWEMtS', '181111039');
INSERT INTO `perwalian` VALUES ('PWL_DJkLQjmhNROH', 'JDW_CzAn8u', '181111093');
INSERT INTO `perwalian` VALUES ('PWL_dLBbGVrz9O1p', 'JDW_YWEMtS', '181111091');
INSERT INTO `perwalian` VALUES ('PWL_DWjdVugmU7vA', 'JDW_ICebnP', '171116018');
INSERT INTO `perwalian` VALUES ('PWL_dZMo2EJUrmx0', 'JDW_YWEMtS', '181111080');
INSERT INTO `perwalian` VALUES ('PWL_e1qN6ywzWf9P', 'JDW_YWEMtS', '191221019');
INSERT INTO `perwalian` VALUES ('PWL_e5VBUy0h4WgA', 'JDW_UOAvFj', '201136001');
INSERT INTO `perwalian` VALUES ('PWL_ebigujWHC3ac', 'JDW_YWEMtS', '191111006');
INSERT INTO `perwalian` VALUES ('PWL_EDYcbsdzkWO2', 'JDW_9VX4ND', '191116019');
INSERT INTO `perwalian` VALUES ('PWL_eGALixWaXE8n', 'JDW_CzAn8u', '181111103');
INSERT INTO `perwalian` VALUES ('PWL_ELYxcAHvSwje', 'JDW_YWEMtS', '181111097');
INSERT INTO `perwalian` VALUES ('PWL_ePdE3HIuqs8n', 'JDW_CzAn8u', '181111037');
INSERT INTO `perwalian` VALUES ('PWL_eUy58nmExqs1', 'JDW_YWEMtS', '181111024');
INSERT INTO `perwalian` VALUES ('PWL_f3btBJx4I9n0', 'JDW_P8uUNA', '201131010');
INSERT INTO `perwalian` VALUES ('PWL_f9EBnxOkTgZv', 'JDW_CzAn8u', '181111035');
INSERT INTO `perwalian` VALUES ('PWL_fDgbE632RJsH', 'JDW_CzAn8u', '141111047');
INSERT INTO `perwalian` VALUES ('PWL_fdTmNuOtHEsa', 'JDW_UOAvFj', '201136009');
INSERT INTO `perwalian` VALUES ('PWL_fGQpPZBOSEqu', 'JDW_YWEMtS', '141111092');
INSERT INTO `perwalian` VALUES ('PWL_fGzMTQElJAKq', 'JDW_CzAn8u', '181111108');
INSERT INTO `perwalian` VALUES ('PWL_FOpo32mB0qc4', 'JDW_YWEMtS', '181111099');
INSERT INTO `perwalian` VALUES ('PWL_fPnFrk9dsgwe', 'JDW_CzAn8u', '191111042');
INSERT INTO `perwalian` VALUES ('PWL_G4937KARPbiH', 'JDW_CzAn8u', '181111009');
INSERT INTO `perwalian` VALUES ('PWL_G6KFWqOIyr9c', 'JDW_YWEMtS', '181111010');
INSERT INTO `perwalian` VALUES ('PWL_G8udDgqaLxMj', 'JDW_YWEMtS', '181111009');
INSERT INTO `perwalian` VALUES ('PWL_GhCfM6eUBtk8', 'JDW_YWEMtS', '191221010');
INSERT INTO `perwalian` VALUES ('PWL_GHe6NrkQd9yw', 'JDW_YWEMtS', '181111033');
INSERT INTO `perwalian` VALUES ('PWL_GjMFUmqr2pw9', 'JDW_UOAvFj', '201136007');
INSERT INTO `perwalian` VALUES ('PWL_gPmRNqdXtfV8', 'JDW_YWEMtS', '181111103');
INSERT INTO `perwalian` VALUES ('PWL_gQSlU4AwNOe5', 'JDW_YWEMtS', '181111092');
INSERT INTO `perwalian` VALUES ('PWL_GwgKPiqFVBRz', 'JDW_YWEMtS', '181111071');
INSERT INTO `perwalian` VALUES ('PWL_gx1QHAdCIKMV', 'JDW_ICebnP', '171116033');
INSERT INTO `perwalian` VALUES ('PWL_gyp1AMilXv5u', 'JDW_YWEMtS', '181111081');
INSERT INTO `perwalian` VALUES ('PWL_HAWXbEMsm5vx', 'JDW_YWEMtS', '181111058');
INSERT INTO `perwalian` VALUES ('PWL_HKQY2JFfbxTN', 'JDW_YWEMtS', '191111011');
INSERT INTO `perwalian` VALUES ('PWL_hYWFBUrSXDKV', 'JDW_YWEMtS', '191111040');
INSERT INTO `perwalian` VALUES ('PWL_i2AdXY3wKPaR', 'JDW_9VX4ND', '171116027');
INSERT INTO `perwalian` VALUES ('PWL_i4p3J8X9mUZc', 'JDW_P8uUNA', '201131008');
INSERT INTO `perwalian` VALUES ('PWL_iEcMH0JBg6eQ', 'JDW_YWEMtS', '171111003');
INSERT INTO `perwalian` VALUES ('PWL_ilKnNI4WwDma', 'JDW_YWEMtS', '191111038');
INSERT INTO `perwalian` VALUES ('PWL_is76hOIaJUk9', 'JDW_ICebnP', '181111018');
INSERT INTO `perwalian` VALUES ('PWL_IUFCVSalwO9R', 'JDW_YWEMtS', '191111017');
INSERT INTO `perwalian` VALUES ('PWL_iV8gxvWZj4Nq', 'JDW_YWEMtS', '181111108');
INSERT INTO `perwalian` VALUES ('PWL_J1Q40fTszLuN', 'JDW_YWEMtS', '181111042');
INSERT INTO `perwalian` VALUES ('PWL_J4VZrWbIlPpj', 'JDW_9VX4ND', '181116010');
INSERT INTO `perwalian` VALUES ('PWL_j5qoRZXkJzpu', 'JDW_9VX4ND', '191116014');
INSERT INTO `perwalian` VALUES ('PWL_jkwdt13AabMo', 'JDW_YWEMtS', '181111016');
INSERT INTO `perwalian` VALUES ('PWL_JmNZObPzMXUl', 'JDW_CzAn8u', '151111091');
INSERT INTO `perwalian` VALUES ('PWL_Jni7ZfWOl5QA', 'JDW_YWEMtS', '191111022');
INSERT INTO `perwalian` VALUES ('PWL_jNqmsHY5FWVl', 'JDW_YWEMtS', '181111066');
INSERT INTO `perwalian` VALUES ('PWL_jO015JRdyZAX', 'JDW_YWEMtS', '191111013');
INSERT INTO `perwalian` VALUES ('PWL_JpuVgt7FZ9w1', 'JDW_9VX4ND', '181116056');
INSERT INTO `perwalian` VALUES ('PWL_JvksCFpYNVib', 'JDW_YWEMtS', '191221017');
INSERT INTO `perwalian` VALUES ('PWL_JVoHxchiE6su', 'JDW_YWEMtS', '191111014');
INSERT INTO `perwalian` VALUES ('PWL_JYdiNODxfM6L', 'JDW_YWEMtS', '181111002');
INSERT INTO `perwalian` VALUES ('PWL_jyMWiOg73t9z', 'JDW_UOAvFj', '201136008');
INSERT INTO `perwalian` VALUES ('PWL_jZdz2xi7QGOb', 'JDW_YWEMtS', '191111034');
INSERT INTO `perwalian` VALUES ('PWL_KcTCiARtpgNJ', 'JDW_YWEMtS', '181111093');
INSERT INTO `perwalian` VALUES ('PWL_kHYIEQfWjgm8', 'JDW_P8uUNA', '201131002');
INSERT INTO `perwalian` VALUES ('PWL_klNxFs46mbei', 'JDW_YWEMtS', '181111060');
INSERT INTO `perwalian` VALUES ('PWL_KnY5VklRQcdW', 'JDW_YWEMtS', '171111098');
INSERT INTO `perwalian` VALUES ('PWL_KOR92CtMzmlx', 'JDW_9VX4ND', '181116037');
INSERT INTO `perwalian` VALUES ('PWL_LEznqIh9Cgfl', 'JDW_9VX4ND', '191116036');
INSERT INTO `perwalian` VALUES ('PWL_Lm7PDoy3eO01', 'JDW_CzAn8u', '141111060');
INSERT INTO `perwalian` VALUES ('PWL_LwvqHXNPFZuW', 'JDW_YWEMtS', '191111001');
INSERT INTO `perwalian` VALUES ('PWL_m1cWACRyJ5jx', 'JDW_YWEMtS', '181111086');
INSERT INTO `perwalian` VALUES ('PWL_mFoUD4l3KtVT', 'JDW_CzAn8u', '191111046');
INSERT INTO `perwalian` VALUES ('PWL_mHbca2xNdwte', 'JDW_ICebnP', '191116010');
INSERT INTO `perwalian` VALUES ('PWL_mpqILyH8M1Z0', 'JDW_YWEMtS', '191111045');
INSERT INTO `perwalian` VALUES ('PWL_nAlOpZ8xrFHz', 'JDW_YWEMtS', '181111084');
INSERT INTO `perwalian` VALUES ('PWL_nDji3Ku5QXqA', 'JDW_9VX4ND', '191116001');
INSERT INTO `perwalian` VALUES ('PWL_Nf47aZFp2g6u', 'JDW_YWEMtS', '191221014');
INSERT INTO `perwalian` VALUES ('PWL_NibuF06m4OXH', 'JDW_YWEMtS', '181111049');
INSERT INTO `perwalian` VALUES ('PWL_NlbgZP6OfCHt', 'JDW_YWEMtS', '191111031');
INSERT INTO `perwalian` VALUES ('PWL_nQjwM9S3eVPI', 'JDW_YWEMtS', '171111029');
INSERT INTO `perwalian` VALUES ('PWL_NsLM18EZz2ht', 'JDW_CzAn8u', '181111097');
INSERT INTO `perwalian` VALUES ('PWL_NUJ45msdCgTi', 'JDW_YWEMtS', '181111035');
INSERT INTO `perwalian` VALUES ('PWL_nuSOPm8MIGQT', 'JDW_CzAn8u', '181111056');
INSERT INTO `perwalian` VALUES ('PWL_NwKSbz5UyYeB', 'JDW_CzAn8u', '151111075');
INSERT INTO `perwalian` VALUES ('PWL_NYGeqdLKRUPC', 'JDW_YWEMtS', '191111053');
INSERT INTO `perwalian` VALUES ('PWL_nzIZWsCRi1H9', 'JDW_YWEMtS', '181111100');
INSERT INTO `perwalian` VALUES ('PWL_OFHEYdnKjQos', 'JDW_CzAn8u', '181111067');
INSERT INTO `perwalian` VALUES ('PWL_OItvjhk92Qyr', 'JDW_ICebnP', '171116030');
INSERT INTO `perwalian` VALUES ('PWL_P45sAaoziktE', 'JDW_YWEMtS', '191111050');
INSERT INTO `perwalian` VALUES ('PWL_PFxEmw8zGRMe', 'JDW_YWEMtS', '191111002');
INSERT INTO `perwalian` VALUES ('PWL_PipM0Le1SzEv', 'JDW_CzAn8u', '181111064');
INSERT INTO `perwalian` VALUES ('PWL_pKEh0XPjNuUM', 'JDW_ICebnP', '171116017');
INSERT INTO `perwalian` VALUES ('PWL_pOPJQzetUWl8', 'JDW_YWEMtS', '181111046');
INSERT INTO `perwalian` VALUES ('PWL_pr68ZQJdwnMX', 'JDW_UOAvFj', '201136003');
INSERT INTO `perwalian` VALUES ('PWL_PuhxLdOGcrCE', 'JDW_UOAvFj', '201136002');
INSERT INTO `perwalian` VALUES ('PWL_PWCjrl6vphcg', 'JDW_YWEMtS', '191111051');
INSERT INTO `perwalian` VALUES ('PWL_PXw9LFhVqZKN', 'JDW_9VX4ND', '191116005');
INSERT INTO `perwalian` VALUES ('PWL_pyh680xjVTsn', 'JDW_YWEMtS', '181111090');
INSERT INTO `perwalian` VALUES ('PWL_PzgdbZHtcNaU', 'JDW_YWEMtS', '181111001');
INSERT INTO `perwalian` VALUES ('PWL_pzI5iODZ9h6o', 'JDW_ICebnP', '171116011');
INSERT INTO `perwalian` VALUES ('PWL_Q7WA8h6a1DbI', 'JDW_YWEMtS', '181111057');
INSERT INTO `perwalian` VALUES ('PWL_QDdZNrfxULjT', 'JDW_YWEMtS', '181111005');
INSERT INTO `perwalian` VALUES ('PWL_QnsaEohYzd8G', 'JDW_YWEMtS', '171111009');
INSERT INTO `perwalian` VALUES ('PWL_QT9oct3KEVXO', 'JDW_CzAn8u', '181111069');
INSERT INTO `perwalian` VALUES ('PWL_qw5ZPUiJusm0', 'JDW_ICebnP', '171116029');
INSERT INTO `perwalian` VALUES ('PWL_QYKorBsFihqx', 'JDW_9VX4ND', '191116013');
INSERT INTO `perwalian` VALUES ('PWL_qzykM83ZTALm', 'JDW_YWEMtS', '181111076');
INSERT INTO `perwalian` VALUES ('PWL_R6NbV8CTnQOj', 'JDW_CzAn8u', '181111046');
INSERT INTO `perwalian` VALUES ('PWL_RdNQPYhevVLc', 'JDW_YWEMtS', '191221021');
INSERT INTO `perwalian` VALUES ('PWL_rPf1uoMjcp82', 'JDW_YWEMtS', '191111041');
INSERT INTO `perwalian` VALUES ('PWL_RS24Dt5g0Orc', 'JDW_CzAn8u', '151111122');
INSERT INTO `perwalian` VALUES ('PWL_S7dEWjoQ2G3h', 'JDW_YWEMtS', '181111031');
INSERT INTO `perwalian` VALUES ('PWL_SCw1Xp7vmRr2', 'JDW_YWEMtS', '191221026');
INSERT INTO `perwalian` VALUES ('PWL_SGoZLn2xQf3X', 'JDW_YWEMtS', '181111043');
INSERT INTO `perwalian` VALUES ('PWL_Sha0Flfpb8k3', 'JDW_YWEMtS', '191221006');
INSERT INTO `perwalian` VALUES ('PWL_sx2NyFld0nGT', 'JDW_CzAn8u', '191111012');
INSERT INTO `perwalian` VALUES ('PWL_SZpd2UCJB9Aq', 'JDW_YWEMtS', '201118001');
INSERT INTO `perwalian` VALUES ('PWL_tDcVmuFUa2MP', 'JDW_CzAn8u', '191111013');
INSERT INTO `perwalian` VALUES ('PWL_Tfl5VkeKbQG6', 'JDW_CzAn8u', '171111115');
INSERT INTO `perwalian` VALUES ('PWL_Tg4F6Bydr1Ze', 'JDW_YWEMtS', '191221002');
INSERT INTO `perwalian` VALUES ('PWL_TLqY0pJRC8E5', 'JDW_YWEMtS', '181111040');
INSERT INTO `perwalian` VALUES ('PWL_tOAKTILgiysl', 'JDW_YWEMtS', '181111107');
INSERT INTO `perwalian` VALUES ('PWL_TQIDr6x9wX3J', 'JDW_CzAn8u', '181111081');
INSERT INTO `perwalian` VALUES ('PWL_ucemGlWdg5XP', 'JDW_YWEMtS', '191221013');
INSERT INTO `perwalian` VALUES ('PWL_UhXaIjMb5S1C', 'JDW_YWEMtS', '181111055');
INSERT INTO `perwalian` VALUES ('PWL_uq0GDRLz9AK5', 'JDW_9VX4ND', '191116004');
INSERT INTO `perwalian` VALUES ('PWL_vkPTKpHtUlm5', 'JDW_YWEMtS', '181111036');
INSERT INTO `perwalian` VALUES ('PWL_vkXU5Omh21Bb', 'JDW_P8uUNA', '201131009');
INSERT INTO `perwalian` VALUES ('PWL_Vmc1n4gv3Pwf', 'JDW_9VX4ND', '191116015');
INSERT INTO `perwalian` VALUES ('PWL_VqKajzSimW3c', 'JDW_CzAn8u', '181111083');
INSERT INTO `perwalian` VALUES ('PWL_vs0BPI2UqJ1Z', 'JDW_YWEMtS', '191111042');
INSERT INTO `perwalian` VALUES ('PWL_vUR0SrwJh2Dp', 'JDW_CzAn8u', '191111022');
INSERT INTO `perwalian` VALUES ('PWL_VUToY8X7QuN9', 'JDW_CzAn8u', '181111060');
INSERT INTO `perwalian` VALUES ('PWL_vztCoBEnW9UY', 'JDW_YWEMtS', '191111043');
INSERT INTO `perwalian` VALUES ('PWL_w1KA0yOkjNve', 'JDW_CzAn8u', '181111099');
INSERT INTO `perwalian` VALUES ('PWL_W71VFRp3xP0Z', 'JDW_YWEMtS', '181111008');
INSERT INTO `perwalian` VALUES ('PWL_wdAl48TjWHE1', 'JDW_9VX4ND', '191116011');
INSERT INTO `perwalian` VALUES ('PWL_wJCLO3iAuVfn', 'JDW_YWEMtS', '181111021');
INSERT INTO `perwalian` VALUES ('PWL_WU7eM8gXvyZn', 'JDW_CzAn8u', '181111020');
INSERT INTO `perwalian` VALUES ('PWL_WZKgjLsOtAUf', 'JDW_YWEMtS', '191111025');
INSERT INTO `perwalian` VALUES ('PWL_Wzxa4yqlt5Fh', 'JDW_9VX4ND', '181116069');
INSERT INTO `perwalian` VALUES ('PWL_X1nSZ5hvpFwD', 'JDW_YWEMtS', '181111004');
INSERT INTO `perwalian` VALUES ('PWL_XALoaV7QOKqm', 'JDW_CzAn8u', '181111080');
INSERT INTO `perwalian` VALUES ('PWL_xg681mhq9Zli', 'JDW_ICebnP', '171116035');
INSERT INTO `perwalian` VALUES ('PWL_xZISCYNRh9s1', 'JDW_YWEMtS', '191111028');
INSERT INTO `perwalian` VALUES ('PWL_YaCUfxlVyHkR', 'JDW_YWEMtS', '191111048');
INSERT INTO `perwalian` VALUES ('PWL_YEXiN0kxp7RJ', 'JDW_YWEMtS', '191221007');
INSERT INTO `perwalian` VALUES ('PWL_yf86JxFWbHrj', 'JDW_YWEMtS', '191221001');
INSERT INTO `perwalian` VALUES ('PWL_ygcqLfJEkxQW', 'JDW_CzAn8u', '171111028');
INSERT INTO `perwalian` VALUES ('PWL_yIlMTuLomzex', 'JDW_YWEMtS', '181111023');
INSERT INTO `perwalian` VALUES ('PWL_ZGlidxVezYgW', 'JDW_9VX4ND', '181116007');
INSERT INTO `perwalian` VALUES ('PWL_zKOfZGPXC7qA', 'JDW_YWEMtS', '191111019');
INSERT INTO `perwalian` VALUES ('PWL_ZPokMd24YUz1', 'JDW_YWEMtS', '191111027');
INSERT INTO `perwalian` VALUES ('PWL_zsfgdeB6WXCK', 'JDW_YWEMtS', '191111054');
INSERT INTO `perwalian` VALUES ('PWL_zSOwJUqDKNC3', 'JDW_YWEMtS', '191111058');
INSERT INTO `perwalian` VALUES ('PWL_ZsWLK18DldxC', 'JDW_9VX4ND', '181116039');

-- ----------------------------
-- Table structure for prodi
-- ----------------------------
DROP TABLE IF EXISTS `prodi`;
CREATE TABLE `prodi`  (
  `KODE_PRODI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAMA_PRODI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`KODE_PRODI`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prodi
-- ----------------------------
INSERT INTO `prodi` VALUES ('DK-S1', 'DESAIN KOMUNIKASI VISUAL');
INSERT INTO `prodi` VALUES ('MI-D3', 'MANAJEMEN INFORMATIKA');
INSERT INTO `prodi` VALUES ('SI-S1', 'SISTEM INFORMASI');
INSERT INTO `prodi` VALUES ('TI-S1', 'TEKNIK INFORMATIKA');

SET FOREIGN_KEY_CHECKS = 1;
