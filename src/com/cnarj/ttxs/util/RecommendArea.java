package com.cnarj.ttxs.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: liz
 * Date: 13-6-25
 * Time: P.M.3:07
 * 商品推荐区域常量类
 */
public class RecommendArea {
    public static  final  String INDEX_FIRST_FLOOR = "index_first_floor";//首页1楼商品
    public static  final  String INDEX_SECOND_FLOOR = "index_second_floor";//首页2楼商品
    public static  final  String INDEX_THIRD_FLOOR = "index_third_floor";//首页3楼商品

    public static Map<String,String> map = new HashMap<String, String>();

    static {
        map.put(INDEX_FIRST_FLOOR,"首页1楼商品");
        map.put(INDEX_SECOND_FLOOR,"首页2楼商品");
        map.put(INDEX_THIRD_FLOOR,"首页3楼商品");
    }

}
