//
//  URLSessionTesting.swift
//  VK-Interface-GB
//
//  Created by Alexander Lezin on 19.01.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.
//

import UIKit


func URLGet() {
    
    // Конфигурация по умолчанию
    let configuration = URLSessionConfiguration.default

    // собственная сессия
    let session =  URLSession(configuration: configuration)
            
    // создаем конструктор для URL
    var urlConstructor = URLComponents()
    // устанавливаем схему
        urlConstructor.scheme = "http"
    // устанавливаем хост
        urlConstructor.host = "samples.openweathermap.org"
    // путь
        urlConstructor.path = "/data/2.5/forecast"
    // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: "München,DE"),
            URLQueryItem(name: "appid", value: "b1b15e88fa797225412429c1c50c122a1")
    ]
    // задача для запуска
    let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
    // в замыкании данные, полученные от сервера, мы преобразуем в json
    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
    // выводим в консоль
        print(json as Any)
    }
    // запускаем задачу
    task.resume()
}

func URLPost() {
    // Конфигурация по умолчанию
    let configuration = URLSessionConfiguration.default

    // собственная сессия
    let session =  URLSession(configuration: configuration)
    
    // создаем конструктор для url
    var urlConstructor = URLComponents()
    // устанавливаем схему
    urlConstructor.scheme = "http"
    // устанавливаем хост
    urlConstructor.host = "jsonplaceholder.typicode.com"
    // путь
    urlConstructor.path = "/posts"
    // параметры для запроса
    urlConstructor.queryItems = [
        URLQueryItem(name: "title", value: "foo"),
        URLQueryItem(name: "body", value: "bar"),
        URLQueryItem(name: "userId", value: "1")
    ]
    
    // создаем запрос
    var request = URLRequest(url: urlConstructor.url!)
    // указываем метод
    request.httpMethod = "POST"
    
    // задача для запуска
    let task = session.dataTask(with: request) { (data, response, error) in
    // в замыкании данные, полученные от сервера, мы преобразуем в json
        let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
    // выводим в консоль
        print(json ?? "Error ocured")
    }
    // запускаем задачу
    task.resume()

}
