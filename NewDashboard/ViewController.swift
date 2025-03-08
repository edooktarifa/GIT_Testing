//
//  ViewController.swift
//  NewDashboard
//
//  Created by Phincon on 15/01/25.
//

import UIKit

//class ViewController: UIViewController {
//
//    // View pertama dan view kedua
//    var viewFirst: UIView!
//    var viewSecond: UIView!
//
//    // Constraint untuk viewSecond
//    var viewSecondLeadingConstraint: NSLayoutConstraint?
//    var viewSecondTopConstraint: NSLayoutConstraint?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Setup viewFirst (container view)
//        let size: CGFloat = 59  // Misalkan ukuran 200x200 untuk view pertama dan kedua
//        viewFirst = UIView()
//        viewFirst.translatesAutoresizingMaskIntoConstraints = false
//        viewFirst.backgroundColor = .lightGray
//        view.addSubview(viewFirst)
//
//        // Menambahkan constraints untuk viewFirst
//        NSLayoutConstraint.activate([
//            viewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            viewFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            viewFirst.widthAnchor.constraint(equalToConstant: size),
//            viewFirst.heightAnchor.constraint(equalToConstant: size)
//        ])
//
//        // Setup viewSecond (view yang bisa digeser)
//        viewSecond = UIView()
//        viewSecond.translatesAutoresizingMaskIntoConstraints = false
//        viewSecond.backgroundColor = .blue
//        view.addSubview(viewSecond)
//
//        // Menambahkan constraints untuk viewSecond
//        viewSecondLeadingConstraint = viewSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120)
//        viewSecondTopConstraint = viewSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
//
//        NSLayoutConstraint.activate([
//            viewSecondLeadingConstraint!,
//            viewSecondTopConstraint!,
//            viewSecond.widthAnchor.constraint(equalToConstant: size),
//            viewSecond.heightAnchor.constraint(equalToConstant: size)
//        ])
//
//        // Tambahkan pan gesture recognizer untuk viewSecond
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//        viewSecond.addGestureRecognizer(panGesture)
//        viewSecond.isUserInteractionEnabled = true
//    }
//
//    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
//        guard let viewSecond = recognizer.view else { return }
//
//        let translation = recognizer.translation(in: view)
//
//        // Mengupdate posisi viewSecond sesuai dengan translasi gesture
//        // Hanya update horizontal (x), biarkan y tetap sama
//        var newLeading = viewSecondLeadingConstraint!.constant + translation.x
//
//        // Membatasi agar viewSecond tidak keluar dari batas view
//        if newLeading < 0 {
//            newLeading = 0
//        } else if newLeading + viewSecond.bounds.size.width > view.bounds.size.width {
//            newLeading = view.bounds.size.width - viewSecond.bounds.size.width
//        }
//
//        // Update hanya constraint horizontal (leading) untuk viewSecond
//        viewSecondLeadingConstraint?.constant = newLeading
//
//        // Reset translasi gesture setelah view digeser
//        recognizer.setTranslation(CGPoint.zero, in: view)
//
//        // Jika gesture selesai (pan selesai), periksa apakah viewSecond sudah berada di dalam viewFirst
//        if recognizer.state == .ended {
//            // Cek apakah viewSecond sudah di dalam viewFirst (hanya berdasarkan posisi horizontal)
//            if viewFirst.frame.intersects(viewSecond.frame) {
//                appendViewToFirst(viewSecond)
//            }
//        }
//    }
//
//    // Fungsi untuk menambahkan viewSecond ke dalam viewFirst setelah di-append
//    func appendViewToFirst(_ viewToAppend: UIView) {
//        // Pastikan posisi dan ukuran viewSecond cocok dengan viewFirst sebelum di-append
//        viewSecondLeadingConstraint?.constant = viewFirst.frame.origin.x
//        viewSecondTopConstraint?.constant = viewFirst.frame.origin.y
//
//        // Animate constraint update
//        UIView.animate(withDuration: 0.3, animations: {
//            // Update Auto Layout untuk memindahkan viewSecond ke dalam viewFirst
//            self.view.layoutIfNeeded()
//        }) { _ in
//            // Setelah animasi selesai, kita menghapus viewSecond dari superview utama dan menambahkannya ke viewFirst
//            viewToAppend.removeFromSuperview()
//            self.viewFirst.addSubview(viewToAppend)
//
//            // Memberi feedback atau melakukan tindakan lain setelah append
//            print("View kedua telah di-append ke view pertama.")
//        }
//    }
//}

//
//import UIKit
//
//class ViewController: UIViewController {
//
//    // View pertama (tempat target untuk view yang digeser)
//    var viewFirst: UIView!
//
//    // Array dari view yang berada dalam viewSecond (tumpukan view)
//    var viewSecondArray: [UIView] = []
//
//    // Constraint untuk setiap view dalam viewSecond (stack)
//    var viewSecondLeadingConstraints: [NSLayoutConstraint] = []
//    var viewSecondTopConstraints: [NSLayoutConstraint] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let size: CGFloat = 59  // Ukuran view yang digunakan (59x59)
//
//        // Setup viewFirst (container untuk view yang digeser)
//        viewFirst = UIView()
//        viewFirst.translatesAutoresizingMaskIntoConstraints = false
//        viewFirst.backgroundColor = .lightGray
//        view.addSubview(viewFirst)
//
//        // Menambahkan constraints untuk viewFirst
//        NSLayoutConstraint.activate([
//            viewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            viewFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            viewFirst.widthAnchor.constraint(equalToConstant: size),
//            viewFirst.heightAnchor.constraint(equalToConstant: size)
//        ])
//
//        // Setup viewSecond (tumpukan view yang dapat digeser)
//        let totalViews = 5  // Misalkan kita membuat 5 view
//        for i in 0..<totalViews {
//            let viewSecond = UIView()
//            viewSecond.translatesAutoresizingMaskIntoConstraints = false
//            viewSecond.backgroundColor = i % 2 == 0 ? .blue : .green // Warna yang berbeda untuk setiap view
//            view.addSubview(viewSecond)
//            viewSecondArray.append(viewSecond)
//
//            // Menambahkan constraints untuk setiap view dalam array (stack)
//            let leadingConstraint = viewSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120)
//            let topConstraint = viewSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 100 + CGFloat(i) * 5) // Set jarak antar view dalam stack
//
//            viewSecondLeadingConstraints.append(leadingConstraint)
//            viewSecondTopConstraints.append(topConstraint)
//
//            NSLayoutConstraint.activate([
//                leadingConstraint,
//                topConstraint,
//                viewSecond.widthAnchor.constraint(equalToConstant: size),
//                viewSecond.heightAnchor.constraint(equalToConstant: size)
//            ])
//
//            // Menambahkan pan gesture untuk setiap view dalam array (viewSecond)
//            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//            viewSecond.addGestureRecognizer(panGesture)
//            viewSecond.isUserInteractionEnabled = true
//        }
//    }
//
//    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
//        guard let viewSecond = recognizer.view else { return }
//
//        let translation = recognizer.translation(in: view)
//
//        // Mengetahui indeks dari view yang sedang digeser
//        guard let index = viewSecondArray.firstIndex(of: viewSecond) else { return }
//
//        // Update posisi view sesuai dengan translasi gesture
//        var newLeading = viewSecondLeadingConstraints[index].constant + translation.x
//
//        // Membatasi agar view tidak keluar dari batas layar
//        if newLeading < 0 {
//            newLeading = 0
//        } else if newLeading + viewSecond.bounds.size.width > view.bounds.size.width {
//            newLeading = view.bounds.size.width - viewSecond.bounds.size.width
//        }
//
//        // Update constraint leading untuk view yang sedang digeser
//        viewSecondLeadingConstraints[index].constant = newLeading
//
//        // Reset translasi gesture setelah view digeser
//        recognizer.setTranslation(CGPoint.zero, in: view)
//
//        // Jika gesture selesai, periksa apakah viewSecond sudah berada di dalam viewFirst
//        if recognizer.state == .ended {
//            // Cek apakah viewSecond sudah berada di dalam area viewFirst
//            if viewFirst.frame.intersects(viewSecond.frame) {
//                appendViewToFirst(viewSecond)
//            }
//        }
//    }
//
//    // Fungsi untuk menambahkan view ke dalam viewFirst setelah digeser
//    func appendViewToFirst(_ viewToAppend: UIView) {
//        // Update posisi viewSecond agar sesuai dengan posisi viewFirst
//        guard let index = viewSecondArray.firstIndex(of: viewToAppend) else { return }
//
//        viewSecondLeadingConstraints[index].constant = viewFirst.frame.origin.x
//        viewSecondTopConstraints[index].constant = viewFirst.frame.origin.y
//
//        // Animasi untuk memindahkan view ke dalam viewFirst
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        }) { _ in
//            // Setelah animasi selesai, pindahkan view ke dalam viewFirst
//            viewToAppend.removeFromSuperview()
//            self.viewFirst.addSubview(viewToAppend)
//
//            // Memberi feedback bahwa view telah dipindahkan
//            print("View \(index + 1) telah dipindahkan ke dalam view pertama.")
//        }
//    }
//}


//import UIKit
//
//class ViewController: UIViewController {
//    
//    // View pertama (tempat target untuk view yang digeser)
//    var viewFirst: UIView!
//    var viewSecond: UIView!
//    
//    // Array dari view yang berada dalam viewSecond (tumpukan view)
//    var viewSecondArray: [UIView] = []
//    
//    // Constraint untuk setiap view dalam viewSecond (stack)
//    var viewSecondLeadingConstraints: [NSLayoutConstraint] = []
//    var viewSecondTopConstraints: [NSLayoutConstraint] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let size: CGFloat = 59  // Ukuran view yang digunakan (59x59)
//        
//        // Setup viewFirst (container untuk view yang digeser)
//        viewFirst = UIView()
//        viewFirst.translatesAutoresizingMaskIntoConstraints = false
//        viewFirst.backgroundColor = .lightGray
//        view.addSubview(viewFirst)
//        
//        // Menambahkan constraints untuk viewFirst
//        NSLayoutConstraint.activate([
//            viewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            viewFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            viewFirst.widthAnchor.constraint(equalToConstant: size),
//            viewFirst.heightAnchor.constraint(equalToConstant: size)
//        ])
//        
//        // Setup viewSecond (tumpukan view yang dapat digeser)
//        let totalViews = 5  // Misalkan kita membuat 5 view
//        for i in 0..<totalViews {
//            viewSecond = UIView()
//            viewSecond.translatesAutoresizingMaskIntoConstraints = false
//            viewSecond.backgroundColor = i % 2 == 0 ? .blue : .green // Warna yang berbeda untuk setiap view
//            view.addSubview(viewSecond)
//            viewSecondArray.append(viewSecond)
//            
//            // Menambahkan constraints untuk setiap view dalam array (stack horizontal)
//            let leadingConstraint = viewSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 145 - CGFloat(i) * 5) // Set jarak antar view dalam stack horizontal (dari kiri ke kanan)
//            let topConstraint = viewSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 100) // Set posisi vertikal tetap
//            
//            viewSecondLeadingConstraints.append(leadingConstraint)
//            viewSecondTopConstraints.append(topConstraint)
//            
//            NSLayoutConstraint.activate([
//                leadingConstraint,
//                topConstraint,
//                viewSecond.widthAnchor.constraint(equalToConstant: size),
//                viewSecond.heightAnchor.constraint(equalToConstant: size)
//            ])
//            // Menambahkan pan gesture untuk setiap view dalam array (viewSecond)
//            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//            viewSecond.addGestureRecognizer(panGesture)
//            viewSecond.isUserInteractionEnabled = true
//        }
//    }
//    
//    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
//        guard let viewSecond = recognizer.view else { return }
//        
//        let translation = recognizer.translation(in: view)
//        
//        // Mengetahui indeks dari view yang sedang digeser
//        guard let index = viewSecondArray.firstIndex(of: viewSecond) else { return }
//        
//        // Update posisi view sesuai dengan translasi gesture
//        var newLeading = viewSecondLeadingConstraints[index].constant + translation.x
//        
//        // Membatasi agar view tidak keluar dari batas layar
//        if newLeading < 0 {
//            newLeading = 0
//        } else if newLeading + viewSecond.bounds.size.width > view.bounds.size.width {
//            newLeading = view.bounds.size.width - viewSecond.bounds.size.width
//        }
//        
//        // Update constraint leading untuk view yang sedang digeser
//        viewSecondLeadingConstraints[index].constant = newLeading
//        
//        // Reset translasi gesture setelah view digeser
//        recognizer.setTranslation(CGPoint.zero, in: view)
//        
//        // Jika gesture selesai, periksa apakah viewSecond sudah berada di dalam viewFirst
//        if recognizer.state == .ended {
//            // Cek apakah viewSecond sudah berada di dalam area viewFirst
//            if viewFirst.frame.intersects(viewSecond.frame) {
//                appendViewToFirst(viewSecond)
//            } else {
//                // Jika viewSecond keluar dari viewFirst, kembali ke dalam stack viewSecond
////                appendViewToSecond(viewSecond)
//            }
//        }
//    }
//    
//    // Fungsi untuk menambahkan view ke dalam viewFirst setelah digeser
//    func appendViewToFirst(_ viewToAppend: UIView) {
//        // Update posisi viewSecond agar sesuai dengan posisi viewFirst
//        guard let index = viewSecondArray.firstIndex(of: viewToAppend) else { return }
//        
//        // Pastikan constraint view diperbarui dengan benar
//        viewSecondLeadingConstraints[index].constant = viewFirst.frame.origin.x
//        viewSecondTopConstraints[index].constant = viewFirst.frame.origin.y
//        
//        // Animasi untuk memindahkan view ke dalam viewFirst
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        }) { _ in
//            // Setelah animasi selesai, pindahkan view ke dalam viewFirst
//            viewToAppend.removeFromSuperview()
//            self.viewFirst.addSubview(viewToAppend)
//            
//            // Memberi feedback bahwa view telah dipindahkan ke dalam view pertama
//            print("View \(index + 1) telah dipindahkan ke dalam view pertama.")
//        }
//    }
//    
//    // Fungsi untuk memindahkan view kembali ke dalam viewSecond setelah dipindahkan ke viewFirst
//    func appendViewToSecond(_ viewToReturn: UIView) {
//        // Temukan indeks dari view yang dikembalikan ke stack
//        guard let index = viewSecondArray.firstIndex(of: viewToReturn) else { return }
//        
//        
//        // Reset posisi view ke dalam stack viewSecond
//        viewSecondLeadingConstraints[index].constant = 145 - CGFloat(index) * 5
//        viewSecondTopConstraints[index].constant = 100
//        
//        // Animasi untuk memindahkan view kembali ke viewSecond
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        }) { _ in
//            // Setelah animasi selesai, pindahkan kembali view ke dalam viewSecond
//            viewToReturn.removeFromSuperview()
//            self.view.addSubview(viewToReturn)  // Ini adalah kesalahan! Kita harus menambahkannya kembali ke viewSecond
//            
//            // Perbaikan: Tambahkan ke container stack, bukan ke view utama
//            self.view.addSubview(viewToReturn) // Ganti ini dengan:
//            self.viewSecondArray[0].addSubview(viewToReturn)  // Menambahkan ke stack viewSecond
//            
//            // Memberi feedback bahwa view telah dipindahkan kembali
//            print("View \(index + 1) telah dipindahkan kembali ke dalam viewSecond.")
//            
//            //            self.viewSecondArray.append(self.viewSecond)
//            
//            // Menambahkan constraints untuk setiap view dalam array (stack horizontal)
//            let leadingConstraint = self.viewSecond.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 145 + CGFloat(index) * 5) // Set jarak antar view dalam stack horizontal (dari kiri ke kanan)
//            let topConstraint = self.viewSecond.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100) // Set posisi vertikal tetap
//
//            self.viewSecondLeadingConstraints.append(leadingConstraint)
//            self.viewSecondTopConstraints.append(topConstraint)
//            
//            NSLayoutConstraint.activate([
//                leadingConstraint,
//                topConstraint,
//                self.viewSecond.widthAnchor.constraint(equalToConstant: 59),
//                self.viewSecond.heightAnchor.constraint(equalToConstant: 59)
//            ])
//            
//            // Menambahkan pan gesture untuk setiap view dalam array (viewSecond)
//            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
//            self.viewSecond.addGestureRecognizer(panGesture)
//            self.viewSecond.isUserInteractionEnabled = true
//            
//        }
//    }
//}

import UIKit

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var scrollView: UIScrollView!
    var data = [["Item 1", "Item 2", "Item 3"], ["Item A", "Item B", "Item C"], ["Item X", "Item Y"], ["Item 1", "Item 2", "Item 3"], ["Item A", "Item B", "Item C"], ["Item X", "Item Y"], ["Item 1", "Item 2", "Item 3"], ["Item A", "Item B", "Item C"], ["Item X", "Item Y"], ["Item 1", "Item 2", "Item 3"], ["Item A", "Item B", "Item C"], ["Item X", "Item Y"]]
    var customHeaderView: UIView!
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup UIScrollView as the parent container, but prevent bounces
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false  // Hide scroll indicators for this view
        scrollView.bounces = false // Disable bounce for the scrollview
        self.view.addSubview(scrollView)

        // Auto Layout for ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        // Setup custom header view (Fixed position above the tableview)
        customHeaderView = UIView()
        customHeaderView.backgroundColor = .lightGray
        customHeaderView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(customHeaderView)

        // Custom header height
        NSLayoutConstraint.activate([
            customHeaderView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            customHeaderView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            customHeaderView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            customHeaderView.heightAnchor.constraint(equalToConstant: 200)
        ])

        // Setup UITableView (With bounces enabled)
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true  // Allow tableview to scroll
        tableView.bounces = true  // Enable bounce effect ONLY on UITableView
        scrollView.addSubview(tableView)

        // Setup refresh control for pull-to-refresh
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl

        // Auto Layout for TableView inside ScrollView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: customHeaderView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            tableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // Make table view same width as scroll view
        ])

        // Set the height of the tableView based on the content
        let tableHeight = CGFloat(data.reduce(0) { $0 + $1.count }) * 44.0  // Assuming 44 height per row
        let tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: tableHeight)
        tableViewHeightConstraint.isActive = true

        // Setup Footer for ScrollView
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(footerView)

        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            footerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            footerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            footerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 20)
        ])

        // Reload table view to make sure it loads data
        tableView.reloadData()
    }

    // MARK: - UITableViewDelegate & UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44 // Optional: Custom header height
    }

    // MARK: - Pull-to-refresh action

    @objc func refreshData() {
        // Simulate data refresh (for example purposes, we'll just wait for a few seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Reload the data and end the refreshing animation
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}
