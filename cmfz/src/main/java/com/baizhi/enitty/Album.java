package com.baizhi.enitty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Album implements Serializable {
    @Id
    private Integer id;
    private String title;
    private String count;
    private String coverImg;
    private String score;
    private String author;
    private String broadcast;
    private String brief;
    private Date pubDate;
}
