package com.xch.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name="album")
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Album {
    //@Id
    private String id;

    private String title;

    private String coverImg;

    private Double score;

    private String author;

    private String broadcast;

    private Integer count;

    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone="GMT+8")
    //@JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd 24H:mm:ss")
    private Date pubDate;


}