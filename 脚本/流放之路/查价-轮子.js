{
    /*
    $.ajax({
        type: "POST",
        url: "https://poe.game.qq.com/api/trade/search/S10%E8%B5%9B%E5%AD%A3",
        data: '{"query":{"status":{"option":"online"},"name":"兽腹","type":"连身龙鳞战甲","stats":[{"type":"and","filters":[]}]},"sort":{"price":"asc"}}',
        cache: false,
        success(data) {
            window.console.log(data)

        }
    })
*/

    let [查询物品, 类型] = "寒光剑 重剑".split(" ")
    let url = "https://poe.game.qq.com/api/trade/search/S10%E8%B5%9B%E5%AD%A3"
    let data = `{"query":{"status":{"option":"online"},"name":"${查询物品}","type":"${类型}","stats":[{"type":"and","filters":[]}]},"sort":{"price":"asc"}}`
    let 地图 = {
        名字: "不洁教堂",
        最低等级: 7,
        最高等级: 7,
    }

    let map = JSON.stringify(
        {
            "query": {
                "status": {
                    "option": "any"
                },
                "type": {
                    "option": 地图.名字,
                    "discriminator": "warfortheatlas"
                },
                "stats": [
                    {
                        "type": "and",
                        "filters": [],
                        "disabled": true
                    }
                ],
                "filters": {
                    "map_filters": {
                        "disabled": false,
                        "filters": {
                            "map_tier": {
                                "min": 地图.最低等级,
                                "max": 地图.最高等级
                            }
                        }
                    }
                }
            },
            "sort": {
                "price": "asc"
            }
        }
    )
    console.log(map)



    fetch(url, {
        method: "post",
        headers: {
            "Content-type": "application/json;charset=UTF-8"
        },
        body: data
    }).then(function (response) {
        console.log(response)
        if (response.ok) {
            response.json().then(json => {
                //取前9个做参考
                const arr = `/api/trade/fetch/${json.result.slice(0, 9).join()}`
                return arr
            }).then(data => {
                console.log(data)
                fetch(data).then(data => {
                    if (data.ok) {
                        console.log(查询物品)
                        data.json().then(data => {
                            for ({ item: { note } }
                                of data.result)
                                console.log(note)
                        })
                    }

                })

            })
        }

    })
}

/*

                for (let o of json.result) {
                    console.log(o)
                }



      headers: {
            "Content-type": "application:/x-www-form-urlencoded:charset=UTF-8"
        },

*/

/*

    $.ajaxSetup({
        global: false,
        type: "POST",
        contentType: 'application/json',
    });

    */