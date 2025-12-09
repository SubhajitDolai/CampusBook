-- SQL Script to create profiles for ALL faculty users
-- Run this AFTER create_users.sql has been executed
-- Total profiles: 769

-- Insert profiles one by one, linking to auth.users by email

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Neelam Sharadchandra Pandit', 'neelam.pandit@mitwpu.edu.in', '1019218030', 'female'::"gender", 'Assistant Professor', 'School of Government'
FROM auth.users WHERE LOWER(email) = LOWER('neelam.pandit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Milind Tukaram Patre', 'milind.patre@mitwpu.edu.in', '1019219010', 'male'::"gender", 'Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('milind.patre@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Shankar Gadekar', 'sachin.gadekar@mitwpu.edu.in', '1019219026', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.gadekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandeep Namdev Dhikale', 'sandeep.dhikale@mitwpu.edu.in', '1019219028', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sandeep.dhikale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Milind Sudhakar Pande', 'milind.pande@mitwpu.edu.in', '1019219055', 'male'::"gender", 'Professor & Pro VC', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('milind.pande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishal Kamalakar Pawar', 'vishal.pawar@mitwpu.edu.in', '1019219058', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('vishal.pawar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akash Arvind Homkar', 'akash.homkar@mitwpu.edu.in', '1019221084', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('akash.homkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shashikala Venkatesh Patil', 'shashikala.patil@mitwpu.edu.in', '1019221095', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shashikala.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pramod Bapu Mali', 'pramod.mali@mitwpu.edu.in', '1019221123', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pramod.mali@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dayeeta Roy', 'dayeeta.roy@mitwpu.edu.in', '1019222127', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('dayeeta.roy@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Murthy Chavali', 'murthy.chavali@mitwpu.edu.in', '1019223041', 'male'::"gender", 'Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('murthy.chavali@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anagha Sudhir Karne', 'anagha.karne@mitwpu.edu.in', '1039217007', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('anagha.karne@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Basavaraj Shantaram Kothavale', 'basavraj.kothavale@mitwpu.edu.in', '1039217026', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('basavraj.kothavale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sanjay Narayan Havaldar', 'sanjay.havaldar@mitwpu.edu.in', '1039217027', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sanjay.havaldar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ramaa Ashish Sandu', 'ramaa.sandu@mitwpu.edu.in', '1039217028', 'female'::"gender", 'Associate Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('ramaa.sandu@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prashant Pralhad Malavadkar', 'prashant.malavadkar@mitwpu.edu.in', '1039217029', 'male'::"gender", 'Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('prashant.malavadkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shantini Aniruddha Bokil', 'shantini.bokil@mitwpu.edu.in', '1039217030', 'female'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shantini.bokil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nilesh Kashinath Birajdar', 'nilesh.birajdar@mitwpu.edu.in', '1039217032', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nilesh.birajdar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prashant Mahadeo Patane', 'prashant.patane@mitwpu.edu.in', '1039217037', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prashant.patane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vilas Sahebrao Kanthale', 'vilas.kanthale@mitwpu.edu.in', '1039217039', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vilas.kanthale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kiran Kisan Kokate', 'kiran.kokate@mitwpu.edu.in', '1039217042', 'male'::"gender", 'Associate Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('kiran.kokate@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaishali Hanumant Gaikwad', 'vaishali.gaikwad@mitwpu.edu.in', '1039217043', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('vaishali.gaikwad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gajanan Malleshi Birajdar', 'gajanan.birajdar@mitwpu.edu.in', '1039217045', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('gajanan.birajdar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Arun Kulkarni', 'sachin.kulkarni1@mitwpu.edu.in', '1039217046', 'male'::"gender", 'Associate Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.kulkarni1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Meghana Ganesh Gote', 'meghna.gote@mitwpu.edu.in', '1039217047', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('meghna.gote@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandeep Sampatrao Sathe', 'sandeep.sathe@mitwpu.edu.in', '1039217049', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sandeep.sathe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mahesh Maganlal Makwana', 'mahesh.makwana@mitwpu.edu.in', '1039217051', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mahesh.makwana@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mrunal Avinash Salwadkar', 'mrunal.salwadkar@mitwpu.edu.in', '1039217053', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mrunal.salwadkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manisha Mohan Wani', 'manisha.wani@mitwpu.edu.in', '1039217054', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('manisha.wani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Smita Sanjay Paithankar', 'smita.paithankar@mitwpu.edu.in', '1039217055', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('smita.paithankar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Puskaraj D Sonawwanay', 'puskaraj.sonawwanay@mitwpu.edu.in', '1039217058', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('puskaraj.sonawwanay@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaishali Manish Joshi', 'vaishali.joshi@mitwpu.edu.in', '1039217059', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('vaishali.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ravindra Dattu Pawarkar', 'ravindra.pawarkar@mitwpu.edu.in', '1039217060', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ravindra.pawarkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sumant Nivarutti Shinde', 'sumant.shinde@mitwpu.edu.in', '1039217062', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sumant.shinde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ajit Baburao Deore', 'ajit.deore@mitwpu.edu.in', '1039217063', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('ajit.deore@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shrihari Mahadeo Bondar', 'shrihari.bondar@mitwpu.edu.in', '1039217064', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shrihari.bondar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rashmi Sanjay Warke', 'rashmi.warke@mitwpu.edu.in', '1039217069', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rashmi.warke@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vrunda Hemant Agarkar', 'vrunda.agarkar@mitwpu.edu.in', '1039217070', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vrunda.agarkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Shivaji Gunjal', 'sachin.gunjal@mitwpu.edu.in', '1039217071', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.gunjal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aparna Virendra Shete', 'aparna.nagure@mitwpu.edu.in', '1039217073', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('aparna.nagure@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kaustubh Ganesh Kulkarni', 'kaustubh.kulkarni@mitwpu.edu.in', '1039217074', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kaustubh.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shubhangi Rajesh Shekokar', 'shubhangi.shekokar@mitwpu.edu.in', '1039217075', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shubhangi.shekokar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pratibha Sharad Kshirsagar', 'pratibha.kshirsagar@mitwpu.edu.in', '1039217076', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('pratibha.kshirsagar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaidehi Vaibhav Deshmukh', 'vaidehi.deshmukh@mitwpu.edu.in', '1039217078', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vaidehi.deshmukh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sanjay Babanrao Bhagwat', 'sanjay.bhagwat@mitwpu.edu.in', '1039217080', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('sanjay.bhagwat@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashish Haribhau Pawar', 'ashish.pawar@mitwpu.edu.in', '1039217081', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ashish.pawar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bhakti Amogh Paranjape', 'bhakti.paranjape@mitwpu.edu.in', '1039217083', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('bhakti.paranjape@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sudhir Pandurang Patil', 'sudhir.patil@mitwpu.edu.in', '1039217085', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sudhir.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Girish Sharad Barpande', 'girish.barpande@mitwpu.edu.in', '1039217086', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('girish.barpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Saket Ravindra Yeolekar', 'saket.yeolekar@mitwpu.edu.in', '1039217087', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('saket.yeolekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ratnakar Raghunath Ghorpade', 'ratnakar.ghorpade@mitwpu.edu.in', '1039217088', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ratnakar.ghorpade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prakash Madhukar Gadhe', 'prakash.gadhe@mitwpu.edu.in', '1039217090', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prakash.gadhe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandeep Chandrakant Potnis', 'sandeep.potnis@mitwpu.edu.in', '1039217096', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sandeep.potnis@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandip Navnathrao Palve', 'sandip.palve@mitwpu.edu.in', '1039217097', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sandip.palve@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Madhuri Amol Bhalekar', 'madhuri.bhalekar@mitwpu.edu.in', '1039217098', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('madhuri.bhalekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manisha Chandrashekhar Kumawat', 'manisha.kumawat@mitwpu.edu.in', '1039217100', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('manisha.kumawat@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aarati Ajit Vagga', 'aarti.vagga@mitwpu.edu.in', '1039217101', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('aarti.vagga@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anuradha Chetan Phadke', 'anuradha.phadke@mitwpu.edu.in', '1039217102', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anuradha.phadke@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prakash Mohan Mainkar', 'prakash.mainkar@mitwpu.edu.in', '1039217103', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prakash.mainkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pradnya Vinayak Deshpande', 'pradnya.deshpande@mitwpu.edu.in', '1039217110', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pradnya.deshpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Darshan Gopalrao Gaidhankar', 'darshan.gaidhankar@mitwpu.edu.in', '1039217111', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('darshan.gaidhankar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ganesh Shivaji Ingle', 'ganesh.ingle@mitwpu.edu.in', '1039217112', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ganesh.ingle@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Snehal Bajarang Kolekar', 'snehal.kolekar@mitwpu.edu.in', '1039217113', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('snehal.kolekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Atul Uddhavrao Palange', 'atul.palange@mitwpu.edu.in', '1039217114', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('atul.palange@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinayak Prabhakar Musale', 'vinayak.musale@mitwpu.edu.in', '1039217116', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vinayak.musale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ruhi Ajit Patankar', 'ruhi.patankar@mitwpu.edu.in', '1039217117', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ruhi.patankar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Omkar Kamalakant Kulkarni', 'omkar.kulkarni@mitwpu.edu.in', '1039217119', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('omkar.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Seema Jitendra Patil', 'seema.patil@mitwpu.edu.in', '1039217120', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('seema.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pralhad Atmaram Pesode', 'pralhad.pesode@mitwpu.edu.in', '1039217121', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pralhad.pesode@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shridevi Chandraprakash Karande', 'shridevi.karande@mitwpu.edu.in', '1039217122', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shridevi.karande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shahbazmubarak Abdulkhadar Dandin', 'shahbaz.dandin@mitwpu.edu.in', '1039217124', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shahbaz.dandin@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Renuka Amit Mane', 'renuka.suryawanshi@mitwpu.edu.in', '1039217128', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('renuka.suryawanshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anita Shivaji Gunjal', 'anita.gunjal@mitwpu.edu.in', '1039217139', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anita.gunjal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaibhav Vijay Kulkarni', 'vaibhav.kulkarni@mitwpu.edu.in', '1039217140', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vaibhav.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prajakta Jagansing Pardeshi', 'prajakta.pardeshi@mitwpu.edu.in', '1039217141', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prajakta.pardeshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vrushali Rajaram Pagire', 'vrushali.pagire@mitwpu.edu.in', '1039217142', 'female'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('vrushali.pagire@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mahesh Balwant Sonawane', 'mahesh.sonawane@mitwpu.edu.in', '1039217147', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mahesh.sonawane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sumedha Dhananjay Sirsikar', 'sumedha.sirsikar@mitwpu.edu.in', '1039217148', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sumedha.sirsikar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shakti Sanjay Kinger', 'shakti.kinger@mitwpu.edu.in', '1039217150', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shakti.kinger@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhishek Prakash Chunawale', 'abhishek.chunawale@mitwpu.edu.in', '1039217152', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('abhishek.chunawale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shrikant Krishnanath Yadav', 'shrikant.yadav@mitwpu.edu.in', '1039217155', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shrikant.yadav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rohit Rajabhau Salgude', 'rohit.salgude@mitwpu.edu.in', '1039217156', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rohit.salgude@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anita Mahesh Thengade', 'anita.thengade@mitwpu.edu.in', '1039217157', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anita.thengade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kundan Ramesh Nagare', 'kundan.nagare@mitwpu.edu.in', '1039217158', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('kundan.nagare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Siddhivinayak Arvind Kulkarni', 'siddhivinayak.kulkarni@mitwpu.edu.in', '1039217159', 'male'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('siddhivinayak.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manojkumar Deorao Hambarde', 'manojkumar.hambarde@mitwpu.edu.in', '1039217454', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('manojkumar.hambarde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Samidha Anand Jawade', 'samidha.jawade@mitwpu.edu.in', '1039217455', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('samidha.jawade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mahesh Nana Pradhan', 'mahesh.pradhan@mitwpu.edu.in', '1039217456', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mahesh.pradhan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rohit Raghunath Ghadge', 'rohit.ghadge@mitwpu.edu.in', '1039217457', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rohit.ghadge@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Surbhi Razdan', 'surbhi.razdan@mitwpu.edu.in', '1039217458', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('surbhi.razdan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pankaj Nivrutti Dhatrak', 'pankaj.dhatrak@mitwpu.edu.in', '1039217459', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pankaj.dhatrak@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dnyaneshwar Ramchandra Waghole', 'dnyaneshwar.waghole@mitwpu.edu.in', '1039217460', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('dnyaneshwar.waghole@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaibhav Narendra Deshmukh', 'vaibhav.deshmukh@mitwpu.edu.in', '1039217462', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vaibhav.deshmukh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mahesh Vasantrao Kulkarni', 'mahesh.kulkarni@mitwpu.edu.in', '1039217463', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mahesh.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Heramb Chintamani Phadake', 'Heramb.phadake@mitwpu.edu.in', '1039217464', 'male'::"gender", 'Assistant Professor', 'Office of Chief Academic Officer'
FROM auth.users WHERE LOWER(email) = LOWER('Heramb.phadake@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shailendra Ashok Dayane', 'shailendra.dayane@mitwpu.edu.in', '1039217465', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shailendra.dayane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ranjana Anup Agrawal', 'ranjana.agrawal@mitwpu.edu.in', '1039217466', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ranjana.agrawal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dipali Prashant Baviskar', 'dipali.baviskar@mitwpu.edu.in', '1039217467', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('dipali.baviskar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Suja Sreejith Panickar', 'suja.panickar@mitwpu.edu.in', '1039217468', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('suja.panickar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shilpa Snehal Sonawani', 'shilpa.sonawani@mitwpu.edu.in', '1039217469', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shilpa.sonawani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vidya Balaji Patil', 'vidya.patil@mitwpu.edu.in', '1039217472', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vidya.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vandana Swapnil Jagtap', 'vandana.jagtap@mitwpu.edu.in', '1039217475', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vandana.jagtap@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bhavana Subhash Tiple', 'bhavana.tiple@mitwpu.edu.in', '1039217476', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('bhavana.tiple@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pranali Kashinath Kosamkar', 'pranali.kosamkar@mitwpu.edu.in', '1039217478', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pranali.kosamkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Umesh Kisan Raut', 'umesh.raut@mitwpu.edu.in', '1039217479', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('umesh.raut@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rashmi Ashwinikumar Rane', 'rashmi.rane@mitwpu.edu.in', '1039217480', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rashmi.rane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pradnya Vaibhav Kulkarni', 'pradnyav.kulkarni@mitwpu.edu.in', '1039217481', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pradnyav.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Madhura Vishnu Phatak', 'madhura.phatak@mitwpu.edu.in', '1039217482', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('madhura.phatak@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Laxmi Bhartesh Bhagwat', 'laxmi.bhagwat@mitwpu.edu.in', '1039217483', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('laxmi.bhagwat@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sarika Sanjay Bobde', 'sarika.bobde@mitwpu.edu.in', '1039217484', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sarika.bobde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Trupti Nitin Baraskar', 'trupti.baraskar@mitwpu.edu.in', '1039217490', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('trupti.baraskar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Priti Swapnil Chakurkar', 'priti.chakurkar@mitwpu.edu.in', '1039217491', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('priti.chakurkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chaitali Vivek Chandankhede', 'chaitali.chandankhede@mitwpu.edu.in', '1039217492', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('chaitali.chandankhede@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Varsha Swapnil Naik', 'varsha.powar@mitwpu.edu.in', '1039217493', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('varsha.powar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sheetal Pravin Girase', 'sheetal.girase@mitwpu.edu.in', '1039217494', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sheetal.girase@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Himangi Milind Pande', 'himangi.pande@mitwpu.edu.in', '1039217496', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('himangi.pande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vanita Raj Tank', 'vanita.tank@mitwpu.edu.in', '1039217497', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vanita.tank@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Harshali Digambar Zodpe', 'harshali.zodpe@mitwpu.edu.in', '1039217498', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('harshali.zodpe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nathrao Bhimrao Jadhav', 'nathrao.jadhav@mitwpu.edu.in', '1039217500', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nathrao.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Savitri Nathrao Jadhav', 'savitri.jadhav@mitwpu.edu.in', '1039217501', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('savitri.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manisha Ravikumar Kowdiki', 'manisha.kowdiki@mitwpu.edu.in', '1039217503', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('manisha.kowdiki@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shweta Yogesh Kukade', 'shweta.kukade@mitwpu.edu.in', '1039217504', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shweta.kukade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rupali Sandip Kute', 'rupali.kute@mitwpu.edu.in', '1039217505', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rupali.kute@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Priyamwada Sachindra Mahajani', 'priyamwada.mahajani@mitwpu.edu.in', '1039217506', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('priyamwada.mahajani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Apurva Abhijit Naik', 'apurva.naik@mitwpu.edu.in', '1039217507', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('apurva.naik@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anuja Amlesh Askhedkar', 'anuja.askhedkar@mitwpu.edu.in', '1039217508', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anuja.askhedkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Alka Surendra Barhatte', 'alka.barhatte@mitwpu.edu.in', '1039217509', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('alka.barhatte@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Raghunath Subhanrao Bhadade', 'raghunath.bhadade@mitwpu.edu.in', '1039217510', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('raghunath.bhadade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nivedita Gunesh Gogate', 'nivedita.gogate@mitwpu.edu.in', '1039217512', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nivedita.gogate@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ketaki Hanamant Kulkarni', 'ketaki.kulkarni@mitwpu.edu.in', '1039217513', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ketaki.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pallavi Prashant Tatpate', 'pallavi.tatpate@mitwpu.edu.in', '1039217515', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pallavi.tatpate@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deepali Sanjay Kulkarni', 'deepali.kulkarni@mitwpu.edu.in', '1039217517', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('deepali.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Malhari Bhimrao Kulkarni', 'malhari.kulkarni@mitwpu.edu.in', '1039217518', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('malhari.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinayak Sudhakar Wadgaonkar', 'vinayak.wadgaonkar@mitwpu.edu.in', '1039217526', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vinayak.wadgaonkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Niraj Subhashrao Topare', 'niraj.topare@mitwpu.edu.in', '1039217527', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('niraj.topare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amolkumar Ramesh Desale', 'amolkumar.desale@mitwpu.edu.in', '1039217528', 'male'::"gender", 'Assistant Professor', 'Office of Dean Academics'
FROM auth.users WHERE LOWER(email) = LOWER('amolkumar.desale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Anant Joshi', 'rahul.joshi@mitwpu.edu.in', '1039217529', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pratiksha Deepak Khurpade', 'pratiksha.khurpadekale@mitwpu.edu.in', '1039217530', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pratiksha.khurpadekale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Samarth Dilip Patwardhan', 'samarth.patwardhan@mitwpu.edu.in', '1039217533', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('samarth.patwardhan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Siraj Ahmed Bhatkar', 'siraj.bhatkar@mitwpu.edu.in', '1039217534', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('siraj.bhatkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Minal Prashant Deshmukh', 'minal.deshmukh@mitwpu.edu.in', '1039217535', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('minal.deshmukh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anand Dhananjay Kulkarni', 'anand.kulkarni@mitwpu.edu.in', '1039217536', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anand.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dinesh Shivratan Bhutada', 'dinesh.bhutada@mitwpu.edu.in', '1039217537', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('dinesh.bhutada@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vikrant Devidas Gaikwad', 'vikrant.gaikwad@mitwpu.edu.in', '1039217538', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vikrant.gaikwad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Ratnakar Deshmukh', 'sachin.deshmukh@mitwpu.edu.in', '1039217542', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.deshmukh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chidanand Dhondappa Koshti', 'chidanand.koshti@mitwpu.edu.in', '1039217544', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('chidanand.koshti@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Atul Marotrao Elgandelwar', 'atul.elgandelwar@mitwpu.edu.in', '1039217545', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('atul.elgandelwar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ganesh Marotrao Kakandikar', 'ganesh.kakandikar@mitwpu.edu.in', '1039217546', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ganesh.kakandikar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deepak Popat Hujare', 'deepak.hujare@mitwpu.edu.in', '1039217547', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('deepak.hujare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nitin Namdeo Pise', 'nitin.pise@mitwpu.edu.in', '1039217548', 'male'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nitin.pise@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Balaji Madhavrao Patil', 'balaji.patil@mitwpu.edu.in', '1039217549', 'male'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('balaji.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shilpa Shirish Paygude', 'shilpa.paygude@mitwpu.edu.in', '1039217550', 'female'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shilpa.paygude@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinaya Vijay Gohokar', 'vinaya.gohokar@mitwpu.edu.in', '1039217551', 'female'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vinaya.gohokar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manisha Ravindra Ingle', 'manisha.ingle@mitwpu.edu.in', '1039217552', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('manisha.ingle@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Parul Madhuraj Jadhav', 'parul.jadhav@mitwpu.edu.in', '1039217553', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('parul.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinodkumar Shamrao Jadhav', 'vinodkumar.jadhav@mitwpu.edu.in', '1039217554', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vinodkumar.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vasi Ahmed Ebrahim Shaikh', 'vasi.shaikh@mitwpu.edu.in', '1039217557', 'male'::"gender", 'Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('vasi.shaikh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shailendra Jagdish Naik', 'shailendra.naik@mitwpu.edu.in', '1039217558', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shailendra.naik@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ratnadip Rajabhau Joshi', 'ratnadip.joshi@mitwpu.edu.in', '1039217560', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ratnadip.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ganesh Pralhadrao Borikar', 'ganesh.borikar@mitwpu.edu.in', '1039217563', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ganesh.borikar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishwanath Dadarao Karad', 'vishwanath.karad@mitwpu.edu.in', '1039217566', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vishwanath.karad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prakash Bhaskar Joshi', 'prakash.joshi@mitwpu.edu.in', '1039217568', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prakash.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bharat Sambhu Chaudhari', 'bharat.chaudhari@mitwpu.edu.in', '1039217569', 'male'::"gender", 'Senior Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('bharat.chaudhari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mrudula Sanjay Kulkarni', 'mrudula.kulkarni@mitwpu.edu.in', '1039217573', 'female'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mrudula.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandip Tukaram Chavan', 'sandip.chavan@mitwpu.edu.in', '1039217575', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sandip.chavan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mangesh Vilas Bedekar', 'mangesh.bedekar@mitwpu.edu.in', '1039217577', 'male'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mangesh.bedekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gourang Mulay', 'gourang.mulay@mitwpu.edu.in', '1039217579', 'male'::"gender", 'Professor of Practice', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('gourang.mulay@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shivprakash Bhagwatrao Barve', 'programdirector.mechanical@mitwpu.edu.in', '1039217585', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('programdirector.mechanical@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shrikant Dattatraya Nimbalkar', 'shrikant.nimbalkar@mitwpu.edu.in', '1039217589', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shrikant.nimbalkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Surendra Hawagirao Barhatte', 'surendra.barhatte@mitwpu.edu.in', '1039217593', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('surendra.barhatte@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shailendrasingh Bhojusingh Girase', 'shailendrasingh.girase@mitwpu.edu.in', '1039217594', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shailendrasingh.girase@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shailendra Punju Shisode', 'shailendra.shisode@mitwpu.edu.in', '1039217595', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shailendra.shisode@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ganesh Devidas Shrigandhi', 'ganesh.shrigandhi@mitwpu.edu.in', '1039217596', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ganesh.shrigandhi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Arun Balaso Mali', 'arun.mali@mitwpu.edu.in', '1039217601', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('arun.mali@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nitinkumar Raghunath Anekar', 'nitinkumar.anekar@mitwpu.edu.in', '1039217602', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nitinkumar.anekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amit Vishnu Jomde', 'amit.jomde@mitwpu.edu.in', '1039217605', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('amit.jomde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashish Shivkumar Utage', 'ashish.utage@mitwpu.edu.in', '1039217608', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ashish.utage@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gautam Jalba Narwade', 'gautam.narwade@mitwpu.edu.in', '1039217611', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('gautam.narwade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mangesh Ramesh Saraf', 'mangesh.saraf@mitwpu.edu.in', '1039217614', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mangesh.saraf@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Niranjan Dhanraj Khaire', 'niranjan.khaire@mitwpu.edu.in', '1039217617', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('niranjan.khaire@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sushila Manish Palwe', 'sushila.palwe@mitwpu.edu.in', '1039217625', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sushila.palwe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prashant Sudhakar Lahane', 'prashant.lahane@mitwpu.edu.in', '1039217626', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prashant.lahane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jayshree Ajit Aher', 'jayshree.aher@mitwpu.edu.in', '1039217634', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('jayshree.aher@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sharmishta Suhas Desai', 'sharmishta.desai@mitwpu.edu.in', '1039217635', 'female'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sharmishta.desai@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sukhada Prasad Bhingarkar', 'sukhada.bhingarkar@mitwpu.edu.in', '1039217639', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sukhada.bhingarkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deepali Pankaj Javale', 'deepali.javale@mitwpu.edu.in', '1039217641', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('deepali.javale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Neha Prasad Sathe', 'neha.sathe@mitwpu.edu.in', '1039217649', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('neha.sathe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shamla Tushar Mantri', 'shamla.mantri@mitwpu.edu.in', '1039217653', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shamla.mantri@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaishali Pankaj Suryawanshi', 'vaishali.suryawanshi@mitwpu.edu.in', '1039217655', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vaishali.suryawanshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vitthal Sadashiv Gutte', 'vitthal.gutte@mitwpu.edu.in', '1039217657', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vitthal.gutte@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dhanashri Narayan Wategaonkar', 'dhanashri.wategaonkar@mitwpu.edu.in', '1039217660', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('dhanashri.wategaonkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amol Prakash Narke', 'amol.narke@mitwpu.edu.in', '1039217661', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('amol.narke@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aparna Ashok Kamble', 'aparna.kamble@mitwpu.edu.in', '1039217673', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('aparna.kamble@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aditi Shantanu Jahagirdar', 'aditi.jahagirdar@mitwpu.edu.in', '1039217677', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('aditi.jahagirdar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Preeti Amit Kale', 'preeti.kale@mitwpu.edu.in', '1039217678', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('preeti.kale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Yogesh Raghunath Kulkarni', 'yogesh.kulkarni@mitwpu.edu.in', '1039217681', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('yogesh.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shounak Rushikesh Sugave', 'shounak.sugave@mitwpu.edu.in', '1039217682', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shounak.sugave@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pradnya Siddhivinayak Kulkarni', 'pradnya.kulkarni@mitwpu.edu.in', '1039217683', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pradnya.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pratvina Vinayak Talele', 'pratvina.talele@mitwpu.edu.in', '1039217685', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pratvina.talele@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rupal Chandulal Shroff', 'rupal.shroff@mitwpu.edu.in', '1039217689', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('rupal.shroff@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rajkumar Damodar Komati', 'rajkumar.komati@mitwpu.edu.in', '1039217690', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rajkumar.komati@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Krishna Keshavrao Warhade', 'krishna.warhade@mitwpu.edu.in', '1039217691', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('krishna.warhade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anagha Yogesh Deshpande', 'anagha.deshpande@mitwpu.edu.in', '1039217692', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anagha.deshpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nilam Mahesh Pradhan', 'nilam.pradhan@mitwpu.edu.in', '1039217694', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nilam.pradhan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manasvi Hrishikesh Patil', 'manasvi.patil@mitwpu.edu.in', '1039217696', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('manasvi.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pooja Pravin Gundewar', 'pooja.gundewar@mitwpu.edu.in', '1039217698', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pooja.gundewar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sunita Mahesh Kulkarni', 'sunita.kulkarni@mitwpu.edu.in', '1039217699', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sunita.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sanjaykumar Ramchandra Kinge', 'sanjaykumar.kinge@mitwpu.edu.in', '1039217700', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sanjaykumar.kinge@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kishanprasad Gangadhar Gunale', 'kishanprasad.gunale@mitwpu.edu.in', '1039217701', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kishanprasad.gunale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sumitra Narayan Motade', 'sumitra.motade@mitwpu.edu.in', '1039217702', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sumitra.motade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mrunal Ninad Annadate', 'mrunal.annadate@mitwpu.edu.in', '1039217703', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mrunal.annadate@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Trushita Sandeep Chaware', 'trushita.chaware@mitwpu.edu.in', '1039217704', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('trushita.chaware@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anjali Rajesh Askhedkar', 'anjali.askhedkar@mitwpu.edu.in', '1039217705', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anjali.askhedkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shruti Ravindra Danve', 'shruti.danve@mitwpu.edu.in', '1039217706', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shruti.danve@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deepa Soumik Nath', 'deepa.nath@mitwpu.edu.in', '1039217707', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('deepa.nath@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jyoti Anirudha Lele', 'jyoti.lele@mitwpu.edu.in', '1039217708', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('jyoti.lele@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ujjwala Shitalkumar Rawandale', 'ujjwala.rawandale@mitwpu.edu.in', '1039217709', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ujjwala.rawandale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gaurav Ghanshyam Narkhede', 'gaurav.narkhede@mitwpu.edu.in', '1039217710', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('gaurav.narkhede@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vibha Utpal Patel', 'vibha.patel@mitwpu.edu.in', '1039217712', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vibha.patel@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kundlik Vitthalrao Mali', 'kundlik.mali@mitwpu.edu.in', '1039217717', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kundlik.mali@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amit Sadanand Savyanavar', 'amit.savyanavar@mitwpu.edu.in', '1039217718', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('amit.savyanavar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bharti Asheesh Dixit', 'bharati.dixit@mitwpu.edu.in', '1039217719', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('bharati.dixit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Uma Ramachandra Pujeri', 'uma.pujeri@mitwpu.edu.in', '1039217721', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('uma.pujeri@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Balaso Nivruti Jagdale', 'balaso.jagdale@mitwpu.edu.in', '1039217722', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('balaso.jagdale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kishor Rambhau Kolhe', 'kishor.kolhe@mitwpu.edu.in', '1039217723', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kishor.kolhe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rashmi Suhas Phalnikar', 'rashmi.phalnikar@mitwpu.edu.in', '1039217724', 'female'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rashmi.phalnikar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anjali Milind Purohit', 'anjali.purohit@mitwpu.edu.in', '1039217725', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anjali.purohit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sunil Brijlal Somani', 'sunil.somani@mitwpu.edu.in', '1039217726', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sunil.somani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anil Satishrao Hiwale', 'anil.hiwale@mitwpu.edu.in', '1039217730', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anil.hiwale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mandar Madhukar Lele', 'mandar.lele@mitwpu.edu.in', '1039217732', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mandar.lele@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Netra Manoj Lokhande', 'netra.lokhande@mitwpu.edu.in', '1039217734', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('netra.lokhande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mandar Shrikrishna Bapat', 'mandar.bapat@mitwpu.edu.in', '1039217741', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('mandar.bapat@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anil Shivsharan Mashalkar', 'anil.mashalkar@mitwpu.edu.in', '1039217939', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anil.mashalkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandeep Balasaheb Pagar', 'sandeep.pagar@mitwpu.edu.in', '1039217943', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('sandeep.pagar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Raju Shivaji Ingale', 'raju.ingale@mitwpu.edu.in', '1039217997', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('raju.ingale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Poonam Chandrakant Bhosale', 'poonam.bhosale@mitwpu.edu.in', '1039218001', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('poonam.bhosale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bhagwat Ishwar Biradi', 'bhagwat.biradi@mitwpu.edu.in', '1039218005', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('bhagwat.biradi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shital Vasant Kahane', 'shital.kahane@mitwpu.edu.in', '1039218006', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('shital.kahane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Radhika Anand Dixit', 'radhika.dixit@mitwpu.edu.in', '1039218008', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('radhika.dixit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chaitanya Girish Burande', 'chaitanya.burande@mitwpu.edu.in', '1039218015', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('chaitanya.burande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jagruti Pravin Minde', 'jagruti.patil@mitwpu.edu.in', '1039218016', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('jagruti.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rasika Ramendra Beohar', 'rasika.beohar@mitwpu.edu.in', '1039218035', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rasika.beohar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rohini Suhas Kale', 'rohini.kale@mitwpu.edu.in', '1039218051', 'female'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rohini.kale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anup Atul Kale', 'anup.kale@mitwpu.edu.in', '1039218064', 'male'::"gender", 'Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('anup.kale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Neha Gaurao Bokey', 'neha.bokey@mitwpu.edu.in', '1039218065', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('neha.bokey@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pankaj Pramod Koparde', 'pankaj.koparde@mitwpu.edu.in', '1039218070', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('pankaj.koparde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amruta Anil Kulkarni', 'amruta.kulkarni@mitwpu.edu.in', '1039218071', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('amruta.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manju Sanjay Kulkarni', 'manju.kulkarni@mitwpu.edu.in', '1039218083', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('manju.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rajib Kumar Sinharay', 'rajib.sinharay@mitwpu.edu.in', '1039218103', 'male'::"gender", 'Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rajib.sinharay@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Adinath Dnyandev Yadhav', 'adinath.yadhav@mitwpu.edu.in', '1039219021', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('adinath.yadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhaysinha Gunvantrao Shelake', 'abhaysinha.shelake@mitwpu.edu.in', '1039219024', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('abhaysinha.shelake@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pravin Raghunath Minde', 'pravin.minde@mitwpu.edu.in', '1039219025', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pravin.minde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sagar Sunil Kolapkar', 'sagar.kolapkar@mitwpu.edu.in', '1039219026', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sagar.kolapkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Himangi Tanmay Neve', 'himangi.neve@mitwpu.edu.in', '1039219058', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('himangi.neve@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rupali Ram Sonolikar', 'rupali.sonolikar@mitwpu.edu.in', '1039219060', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rupali.sonolikar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sanket Rajesh Tirpude', 'sanket.tirpude@mitwpu.edu.in', '1039219061', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sanket.tirpude@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amit Liladhar Nehete', 'amit.nehete@mitwpu.edu.in', '1039219064', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('amit.nehete@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chetan Bhimrao Khadse', 'chetan.khadse@mitwpu.edu.in', '1039219068', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('chetan.khadse@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Kisan Jagtap', 'rahul.jagtap@mitwpu.edu.in', '1039219075', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.jagtap@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhishek Madhukar Thote', 'abhishek.thote@mitwpu.edu.in', '1039219077', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('abhishek.thote@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shiv Havgirao Sutar', 'shiv.sutar@mitwpu.edu.in', '1039220003', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shiv.sutar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Saee Omkar Sumant', 'saee.sumant@mitwpu.edu.in', '1039220023', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('saee.sumant@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anand Jayant Kulkarni', 'anand.j.kulkarni@mitwpu.edu.in', '1039221006', 'male'::"gender", 'Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('anand.j.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gopinath T', 'gopinath.t@mitwpu.edu.in', '1039221007', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('gopinath.t@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Meera Jeevan Reddy Chintala', 'meera.behera@mitwpu.edu.in', '1039221010', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('meera.behera@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deepak Kumar', 'deepak.kumar@mitwpu.edu.in', '1039221011', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('deepak.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Parshant Kumar', 'parshant.kumar@mitwpu.edu.in', '1039221012', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('parshant.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Arunabh Pandey', 'arunabh.pandey@mitwpu.edu.in', '1039221020', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('arunabh.pandey@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ishaan Ramdasji Kale', 'ishaan.kale@mitwpu.edu.in', '1039222001', 'male'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('ishaan.kale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Makrand Mahadev Wagale', 'makrand.wagale@mitwpu.edu.in', '1039222008', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('makrand.wagale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mitulkumar Thakorbhai Solanki', 'mitulkumar.solanki@mitwpu.edu.in', '1039222013', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mitulkumar.solanki@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Apoorva Sanket Shastri', 'apoorva.shastri@mitwpu.edu.in', '1039222015', 'female'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('apoorva.shastri@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vivek Patel', 'vivek.patel@mitwpu.edu.in', '1039222016', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vivek.patel@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Baidehish Sahoo', 'baidehish.sahoo@mitwpu.edu.in', '1039222017', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('baidehish.sahoo@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Yogita Shivaji Hande', 'yogita.hande@mitwpu.edu.in', '1039222025', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('yogita.hande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishakha Vijay Sakhare', 'vishakha.sakhare@mitwpu.edu.in', '1039222034', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vishakha.sakhare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shivani Gupta', 'shivani.gupta@mitwpu.edu.in', '1039222035', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shivani.gupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sushrut Hemant Vinchurkar', 'sushrut.vinchurkar@mitwpu.edu.in', '1039222037', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sushrut.vinchurkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sagar Pralhad Kanekar', 'sagar.kanekar@mitwpu.edu.in', '1039222066', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sagar.kanekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ankita Agarwal', 'ankita.agarwal@mitwpu.edu.in', '1039223014', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ankita.agarwal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Tarun Narayan Shankar', 'tarun.shankar@mitwpu.edu.in', '1039223023', 'male'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('tarun.shankar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shubhangi Rastogi', 'shubhangi.rastogi@mitwpu.edu.in', '1039223029', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shubhangi.rastogi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ruchi Rani', 'ruchi.rani@mitwpu.edu.in', '1039223030', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ruchi.rani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sheetal Abhijit Kulkarni', 'sheetal.kulkarni@mitwpu.edu.in', '1039223031', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sheetal.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anuradha Sachin Nagare', 'anuradha.nagare@mitwpu.edu.in', '1039223037', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anuradha.nagare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Lalit Kane', 'lalit.kane@mitwpu.edu.in', '1039223038', 'male'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('lalit.kane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Madhuri Rao', 'madhuri.rao@mitwpu.edu.in', '1039223049', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('madhuri.rao@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Seema Idhate', 'seema.idhate@mitwpu.edu.in', '1039223050', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('seema.idhate@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ajita Jadhav', 'ajita.jadhav@mitwpu.edu.in', '1039223052', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ajita.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shraddha Suyog Kulkarni', 'Shraddha.kulkarni@mitwpu.edu.in', '1039223062', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('Shraddha.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sharbani Kaushik', 'sharbani.kaushik@mitwpu.edu.in', '1039223068', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sharbani.kaushik@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pranati Waghodekar', 'pranati.waghodekar@mitwpu.edu.in', '1039224001', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pranati.waghodekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Reshma Sonar', 'reshma.sonar@mitwpu.edu.in', '1039224002', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('reshma.sonar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chandrashekhar Himmatrao Patil', 'chandrashekhar.patil@mitwpu.edu.in', '1049201001', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('chandrashekhar.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shubhangi Vitthal Gaikwad', 'shubhangi.gaikwad@mitwpu.edu.in', '1049217037', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('shubhangi.gaikwad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Suvarna Gopal Ranade', 'suvarna.ranade@mitwpu.edu.in', '1049217039', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('suvarna.ranade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sheetal Suresh Rajapurkar', 'sheetal.rajapurkar@mitwpu.edu.in', '1049217043', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sheetal.rajapurkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Bhimrao Bhoite', 'sachin.bhoite@mitwpu.edu.in', '1049217047', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.bhoite@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jivan Pandharinath Biradar', 'jivan.biradar@mitwpu.edu.in', '1049217052', 'male'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('jivan.biradar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swapnil Virendra Chalwadi', 'swapnil.chalwadi@mitwpu.edu.in', '1049217057', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('swapnil.chalwadi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rajashree Sahadeo Jadhav', 'rajashree.jadhav@mitwpu.edu.in', '1049217059', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('rajashree.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Varsha Manohar Sontakke', 'varsha.sontakke@mitwpu.edu.in', '1049217061', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('varsha.sontakke@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shankar Maruti Mali', 'shankar.mali@mitwpu.edu.in', '1049217068', 'male'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shankar.mali@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Parimal Maya Sudhakar', 'parimal.sudhakar@mitwpu.edu.in', '1049217069', 'male'::"gender", 'Associate Professor', 'School of Government'
FROM auth.users WHERE LOWER(email) = LOWER('parimal.sudhakar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rajeshwari Shivashankar Ghatti', 'rajeshwari.ghatti@mitwpu.edu.in', '1049217122', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('rajeshwari.ghatti@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nitin Mohanlal Sharma', 'nitin.sharma@mitwpu.edu.in', '1049217126', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('nitin.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashish Shrikrishna Kathale', 'ashish.kathale@mitwpu.edu.in', '1049217251', 'male'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('ashish.kathale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashwini Virendra Ghaisas', 'ashwini.ghaisas@mitwpu.edu.in', '1049218011', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('ashwini.ghaisas@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akshay Narhari Shintre', 'akshay.shintre@mitwpu.edu.in', '1049218012', 'male'::"gender", 'Associate Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('akshay.shintre@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vikas Tejerao Waghmare', 'vikas.waghmare@mitwpu.edu.in', '1049218038', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('vikas.waghmare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chaitanya Tanaji Gite', 'chaitanya.gite@mitwpu.edu.in', '1049218040', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('chaitanya.gite@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaibhav Avinash Joshi', 'vaibhav.joshi@mitwpu.edu.in', '1059217002', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('vaibhav.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gautam Surendra Bapat', 'gautam.bapat@mitwpu.edu.in', '1059217003', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('gautam.bapat@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Diksha Dinar Bedekar', 'diksha.bedekar@mitwpu.edu.in', '1059217004', 'female'::"gender", 'Assistant Professor', 'Internal Quality Assurance Centre'
FROM auth.users WHERE LOWER(email) = LOWER('diksha.bedekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ravikumar Manohar Chitnis', 'ravikumar.chitnis@mitwpu.edu.in', '1059217038', 'male'::"gender", 'Vice Chancellor', 'Office of Vice Chancellor'
FROM auth.users WHERE LOWER(email) = LOWER('ravikumar.chitnis@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anjali Ajit Sane', 'anjali.sane@mitwpu.edu.in', '1059217040', 'female'::"gender", 'Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('anjali.sane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sudeepta Banerjee', 'sudeepta.banerjee@mitwpu.edu.in', '1059217041', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sudeepta.banerjee@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prasad Jeevan Pathak', 'prasad.pathak@mitwpu.edu.in', '1059217042', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('prasad.pathak@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinaya Umesh Nimbolkar', 'vinaya.nimbolkar@mitwpu.edu.in', '1059217043', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('vinaya.nimbolkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amruta Pradeep Dixit', 'amruta.dixit@mitwpu.edu.in', '1059217045', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('amruta.dixit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sumita Pradeep Joshi', 'sumita.joshi@mitwpu.edu.in', '1059217046', 'female'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('sumita.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pradnya Madhav Gaikwad', 'pradnya.gaikwad@mitwpu.edu.in', '1059217048', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('pradnya.gaikwad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pallavi Prasen Adya', 'pallavi.adya@mitwpu.edu.in', '1059217049', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('pallavi.adya@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Geetika Rohit Parmar', 'geetika.parmar@mitwpu.edu.in', '1059217052', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('geetika.parmar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pournima Nilesh Inamdar', 'pournima.inamdar@mitwpu.edu.in', '1059217059', 'female'::"gender", 'Associate Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('pournima.inamdar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shreeya Chidambar Rajpurohit', 'shreeya.rajpurohit@mitwpu.edu.in', '1059218003', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('shreeya.rajpurohit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sadanand Santosh Borse', 'sadanand.borse@mitwpu.edu.in', '1059218009', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sadanand.borse@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shweta Onkar Deshpande', 'shweta.deshpande@mitwpu.edu.in', '1059218016', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('shweta.deshpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaidehi Ajinkya Mirajkar', 'vaidehi.mirajkar@mitwpu.edu.in', '1059218018', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('vaidehi.mirajkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pranjali Prasad Deshpande', 'pranjali.deshpande@mitwpu.edu.in', '1059218023', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('pranjali.deshpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kavita Karan Ingale', 'kavita.ingale@mitwpu.edu.in', '1059219035', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('kavita.ingale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bhagyashri Dinesh Deshpande', 'bhagyashri.deshpande@mitwpu.edu.in', '1059220001', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('bhagyashri.deshpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deepali D Shahane', 'deepali.shahane@mitwpu.edu.in', '1059221005', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('deepali.shahane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deependra Sharma', 'deependra.sharma@mitwpu.edu.in', '1059222005', 'male'::"gender", 'Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('deependra.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mohsin Rehman Shaikh', 'mohsin.shaikh@mitwpu.edu.in', '1059222007', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('mohsin.shaikh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chetan Vilas Mungantiwar', 'chetan.mungantiwar@mitwpu.edu.in', '1059222009', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('chetan.mungantiwar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manoj Pralhad Nigadkar', 'manoj.nigadkar@mitwpu.edu.in', '1059223003', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('manoj.nigadkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ravi Kshirsagar', 'ravi.kshirsagar@mitwpu.edu.in', '1059223004', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('ravi.kshirsagar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swati Deepak Bankar', 'swati.bankar@mitwpu.edu.in', '1069201004', 'female'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('swati.bankar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sushil Ganpatrao Nirbhavane', 'sushil.nirbhavane@mitwpu.edu.in', '1069201008', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sushil.nirbhavane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Joseph Vidyasagar Tandhara', 'tj.vidyasagar@mitwpu.edu.in', '1069217002', 'male'::"gender", 'Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('tj.vidyasagar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Girish Shamraoji Mude', 'girish.mude@mitwpu.edu.in', '1069217004', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('girish.mude@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swapnil Narayan Undale', 'swapnil.undale@mitwpu.edu.in', '1069217005', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('swapnil.undale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aparna Sameer Dixit', 'aparna.dixit@mitwpu.edu.in', '1069217008', 'female'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('aparna.dixit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swapna Anand Saoji', 'swapna.saoji@mitwpu.edu.in', '1069217009', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('swapna.saoji@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dhanashree Umesh Tharkude', 'dhanashree.tharkude@mitwpu.edu.in', '1069217010', 'female'::"gender", 'Associate Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('dhanashree.tharkude@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinita Vinod Ahire', 'vinita.kale@mitwpu.edu.in', '1069217012', 'female'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('vinita.kale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pallavi Rahul Gedamkar', 'pallavi.gedamkar@mitwpu.edu.in', '1069217013', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('pallavi.gedamkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dinesh Manmohan Banswal', 'dinesh.banswal@mitwpu.edu.in', '1069217014', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('dinesh.banswal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shubhalaxmi Sanjay Joshi', 'shubhalaxmi.joshi@mitwpu.edu.in', '1069217021', 'female'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shubhalaxmi.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sunil Machindra Adhav', 'sunil.adhav@mitwpu.edu.in', '1069217023', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sunil.adhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Renuka Snehal Nifadkar', 'renuka.deshmukh@mitwpu.edu.in', '1069217101', 'female'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('renuka.deshmukh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sonal Manohar Muluk', 'sonal.muluk@mitwpu.edu.in', '1069217103', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sonal.muluk@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhishek Bratindranath Mukherjee', 'abhishek.mukherjee@mitwpu.edu.in', '1069219002', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('abhishek.mukherjee@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rajashri Amit Kadam', 'rajashri.kadam@mitwpu.edu.in', '1069219003', 'female'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('rajashri.kadam@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jaideep Gulabrao Jadhav', 'jaideep.jadhav@mitwpu.edu.in', '1069219009', 'male'::"gender", 'Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('jaideep.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ravi Motilal Sahu', 'ravi.sahu@mitwpu.edu.in', '1069219027', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('ravi.sahu@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rupali Gupta', 'rupali.gupta@mitwpu.edu.in', '1069221019', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('rupali.gupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Vishwanath Dandage', 'rahul.dandage@mitwpu.edu.in', '1069221021', 'male'::"gender", 'Associate Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.dandage@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rajesh Prannath Jawajala', 'rajesh.jawajala@mitwpu.edu.in', '1069221023', 'male'::"gender", 'Associate Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('rajesh.jawajala@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rajeev Sengupta', 'rajeev.sengupta@mitwpu.edu.in', '1069221033', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('rajeev.sengupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ameya Anil Patil', 'ameya.patil@mitwpu.edu.in', '1069222008', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('ameya.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prashant Vilas Chaudhary', 'prashant.chaudhary@mitwpu.edu.in', '1069222009', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('prashant.chaudhary@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vijaykumar Santukrao Bilolikar', 'vijaykumar.bilolikar@mitwpu.edu.in', '1069222041', 'male'::"gender", 'Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('vijaykumar.bilolikar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Raj Kumar Rajak', 'rajkumar.rajak@mitwpu.edu.in', '1069223001', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('rajkumar.rajak@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Umesh Shirvastava', 'umesh.shrivastava@mitwpu.edu.in', '1069223010', 'male'::"gender", 'Associate Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('umesh.shrivastava@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kunal Gaurav', 'kunal.gaurav@mitwpu.edu.in', '1069223035', 'male'::"gender", 'Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('kunal.gaurav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Saurabh Ardra', 'saurabh.ardra@mitwpu.edu.in', '1069223037', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('saurabh.ardra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Maheshkumar Landge', 'maheshkumar.landge@mitwpu.edu.in', '1069223041', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('maheshkumar.landge@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Srivastava', 'sachin.srivastava@mitwpu.edu.in', '1069223043', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.srivastava@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Divyanshi Pal', 'divyanshi.pal@mitwpu.edu.in', '1069223045', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('divyanshi.pal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nitin Balasaheb Shinde', 'nitin.shinde@mitwpu.edu.in', '1069223049', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('nitin.shinde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sasmita Behera', 'sasmita.behera@mitwpu.edu.in', '1069223066', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('sasmita.behera@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Piyush Pravinkumar Shaha', 'piyush.shaha@mitwpu.edu.in', '1069223067', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('piyush.shaha@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashish Andhale', 'ashish.andhale@mitwpu.edu.in', '1069223082', 'male'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('ashish.andhale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akanksha Jaiswal', 'akanksha.jaiswal@mitwpu.edu.in', '1069223086', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('akanksha.jaiswal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gourav Pednekar', 'gourav.pednekar@mitwpu.edu.in', '1069223101', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('gourav.pednekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mahesh Kumar', 'mahesh.kumar@mitwpu.edu.in', '1069224002', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('mahesh.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mohit Kant Kaushik', 'mohit.kaushik@mitwpu.edu.in', '1069224004', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('mohit.kaushik@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Varsha Shriram Nerlekar', 'varsha.nerlekar@mitwpu.edu.in', '1079217004', 'female'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('varsha.nerlekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Moumita Dipesh Sharma', 'moumita.sharma@mitwpu.edu.in', '1079217006', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('moumita.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dhrupa Basant Bhatia', 'dhrupa.bhatia@mitwpu.edu.in', '1079217007', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('dhrupa.bhatia@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shraddha Subhash Kokane', 'shraddha.kokane@mitwpu.edu.in', '1079217008', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('shraddha.kokane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Supriya Dhananjay Paigude', 'supriya.paigude@mitwpu.edu.in', '1079217009', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('supriya.paigude@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aparna Dattatraya Pathak', 'aparna.pathak@mitwpu.edu.in', '1079217014', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('aparna.pathak@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Smita Chaitanya Pangarkar', 'smita.pangarkar@mitwpu.edu.in', '1079217015', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('smita.pangarkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shweta Devendra Shirolkar', 'shweta.shirolkar@mitwpu.edu.in', '1079217016', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('shweta.shirolkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Meenal Kaustubh Pendse', 'meenal.pendse@mitwpu.edu.in', '1079217017', 'female'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('meenal.pendse@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vedashree Tushar Mali', 'vedashree.mali@mitwpu.edu.in', '1079217021', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('vedashree.mali@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manjiri Vishal Gadekar', 'manjiri.gadekar@mitwpu.edu.in', '1079217142', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('manjiri.gadekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Adwait Sharadchandra Oak', 'adwait.oak@mitwpu.edu.in', '1079217147', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('adwait.oak@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gopal Vasudeo Wamane', 'gopal.wamane@mitwpu.edu.in', '1089217062', 'male'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('gopal.wamane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'V Lenin Kumar', 'v.leninkumar@mitwpu.edu.in', '1089218028', 'male'::"gender", 'Assistant Professor', 'School of Government'
FROM auth.users WHERE LOWER(email) = LOWER('v.leninkumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sanjay Upadhaye', 'sanjay.upadhye@mitwpu.edu.in', '1089220007', 'male'::"gender", 'Professor', 'School of Government'
FROM auth.users WHERE LOWER(email) = LOWER('sanjay.upadhye@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandhya Sreekumar Pillai', 'sandhya.sreekumar@mitwpu.edu.in', '1089221007', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('sandhya.sreekumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sheetal Rajan Walvekar', 'sheetal.walvekar@mitwpu.edu.in', '1089221008', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('sheetal.walvekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Heenakshi Bhansali', 'heenakshi.bhansali@mitwpu.edu.in', '1109217002', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('heenakshi.bhansali@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akshay Motilal Baheti', 'akshay.baheti@mitwpu.edu.in', '1109218002', 'male'::"gender", 'Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('akshay.baheti@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Satish Arunrao Polshettiwar', 'satish.polshettiwar@mitwpu.edu.in', '1109218003', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('satish.polshettiwar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashwini Ramkrishana Gawade', 'ashwini.gawade@mitwpu.edu.in', '1109218030', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ashwini.gawade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bhagwat Uddhavrao Nagargoje', 'bhagwat.nagargoje@mitwpu.edu.in', '1109218031', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('bhagwat.nagargoje@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Arti Girish Swami', 'arti.swami@mitwpu.edu.in', '1109218033', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('arti.swami@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhijeet Subhash Sutar', 'abhijeet.sutar@mitwpu.edu.in', '1109218034', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('abhijeet.sutar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ganesh Bhaurao Choudhari', 'ganesh.choudhari@mitwpu.edu.in', '1109218036', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ganesh.choudhari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anil Tukaram Pawar', 'anil.pawar@mitwpu.edu.in', '1109218037', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anil.pawar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Yogita Sachin Ozarde', 'yogita.ozarde@mitwpu.edu.in', '1109218038', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('yogita.ozarde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chandrashekhar D. Bobade', 'chandrashekhar.bobade@mitwpu.edu.in', '1109218039', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('chandrashekhar.bobade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ranjit Vinayak Gadhave', 'ranjit.gadhave@mitwpu.edu.in', '1109218041', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ranjit.gadhave@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prajakta Vishal Adsule', 'prajkta.adsule@mitwpu.edu.in', '1109218043', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prajkta.adsule@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jayant Jagnnath Khandare', 'jayant.khandare@mitwpu.edu.in', '1109218045', 'male'::"gender", 'Professor', 'School of Consciousness'
FROM auth.users WHERE LOWER(email) = LOWER('jayant.khandare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swati Changdeo Jagdale', 'swati.jagdale@mitwpu.edu.in', '1109218046', 'female'::"gender", 'Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('swati.jagdale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anuruddha Rajaram Chabukswar', 'anuruddha.chabukswar@mitwpu.edu.in', '1109218047', 'male'::"gender", 'Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anuruddha.chabukswar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishnu Prabhakar Choudhari', 'vishnu.choudhari@mitwpu.edu.in', '1109218048', 'male'::"gender", 'Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vishnu.choudhari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Chinmay Devidas Deshmukh', 'chinmay.deshmukh@mitwpu.edu.in', '1109218053', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('chinmay.deshmukh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aarti Renukadas Shastri', 'aarti.shastri@mitwpu.edu.in', '1109218054', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('aarti.shastri@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashwin Bhanudas Kuchekar', 'ashwin.kuchekar@mitwpu.edu.in', '1109219001', 'male'::"gender", 'Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ashwin.kuchekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sudhirkumar Shinde', 'sudhirkumar.shinde@mitwpu.edu.in', '1109221001', 'male'::"gender", 'Associate Professor', 'School of Consciousness'
FROM auth.users WHERE LOWER(email) = LOWER('sudhirkumar.shinde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Summon Koul', 'summon.koul@mitwpu.edu.in', '1109221002', 'female'::"gender", 'Professor', 'School of Consciousness'
FROM auth.users WHERE LOWER(email) = LOWER('summon.koul@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sanjeev Kumar', 'sanjeev.kumar@mitwpu.edu.in', '1109221003', 'male'::"gender", 'Professor', 'School of Consciousness'
FROM auth.users WHERE LOWER(email) = LOWER('sanjeev.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amol Ambadas Tagalpallewar', 'amol.tagalpallewar@mitwpu.edu.in', '1109221004', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('amol.tagalpallewar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rohini Revansiddappa Pujari', 'rohini.pujari@mitwpu.edu.in', '1109221007', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rohini.pujari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Neeraj Mahindroo', 'neeraj.mahindroo@mitwpu.edu.in', '1109222007', 'male'::"gender", 'Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('neeraj.mahindroo@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shvetank Bhatt', 'shvetank.bhatt@mitwpu.edu.in', '1109222011', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shvetank.bhatt@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vijayapandi Pandy', 'vijayapandi.pandy@mitwpu.edu.in', '1109222014', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vijayapandi.pandy@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sujit Kumar Sah', 'sujit.sah@mitwpu.edu.in', '1109223001', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sujit.sah@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prashant Joshi', 'prashant.joshi@mitwpu.edu.in', '1109223020', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prashant.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shamim Mohammad', 'shamim.mohd@mitwpu.edu.in', '1109223021', 'male'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shamim.mohd@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nikita Subhash Hinge', 'nikita.hinge@mitwpu.edu.in', '1109223022', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nikita.hinge@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shrikant Bhimrao Khade', 'shrikant.khade@mitwpu.edu.in', '1109223023', 'male'::"gender", 'Veterinarian', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shrikant.khade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Asim Kumar Samanta', 'asim.samanta@mitwpu.edu.in', '1109223024', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('asim.samanta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Poonam Rajiv Inamdar', 'poonam.inamdar@mitwpu.edu.in', '1109224001', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('poonam.inamdar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Yashpal Dashrath Netragaonkar', 'yashpal.netragaonkar@mitwpu.edu.in', '1119215001', 'male'::"gender", 'Associate Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('yashpal.netragaonkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anagha Arun Mahajan', 'anagha.mahajan@mitwpu.edu.in', '1119216001', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('anagha.mahajan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Jagannath Sakhare', 'sachin.sakhare@mitwpu.edu.in', '1119217005', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.sakhare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Priya Bahirnath Kale', 'priya.kale@mitwpu.edu.in', '1119217011', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('priya.kale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vandana Ramrao Kenjale', 'vandana.kenjale@mitwpu.edu.in', '1119217012', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('vandana.kenjale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Gangadhar Landge', 'rahul.landge@mitwpu.edu.in', '1119217014', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.landge@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shalini Santosh Tonpe', 'shalini.tonpe@mitwpu.edu.in', '1119217015', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('shalini.tonpe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anuja Dilip Dhulekar', 'anuja.dhulekar@mitwpu.edu.in', '1129220001', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('anuja.dhulekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prajakta Balchandra Khanwalkar', 'prajakta.khanwalkar@mitwpu.edu.in', '1129220003', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('prajakta.khanwalkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishwajeet Dilip Kale', 'vishwajeet.kale@mitwpu.edu.in', '1129220015', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('vishwajeet.kale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ganesh Suresh Jadhav', 'ganesh.jadhav@mitwpu.edu.in', '1129221001', 'male'::"gender", 'Associate Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('ganesh.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Neelesh Madhukar Gham', 'neelesh.gham@mitwpu.edu.in', '1129222003', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('neelesh.gham@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kirti Anup Deshpande', 'kirti.deshpande@mitwpu.edu.in', '1129222005', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('kirti.deshpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sharmishtha Salunke', 'sharmishtha.salunke@mitwpu.edu.in', '1129222011', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('sharmishtha.salunke@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rashmi Pethe', 'rashmi.pethe@mitwpu.edu.in', '1129222012', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('rashmi.pethe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vatsala Sutar', 'vatsala.sutar@mitwpu.edu.in', '1129222019', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('vatsala.sutar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rashmi Sridhara', 'rashmi.sridhara@mitwpu.edu.in', '1129223002', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('rashmi.sridhara@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ambrish Gaur', 'ambrish.gaur@mitwpu.edu.in', '1129223006', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('ambrish.gaur@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gayatri Aditya Lele', 'gayatri.lele@mitwpu.edu.in', '1129223013', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('gayatri.lele@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Jadhav', 'sachin.jadhav@mitwpu.edu.in', '1129223018', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mayuri Tulsidas Dabhi', 'mayuri.dabhi@mitwpu.edu.in', '1129223041', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('mayuri.dabhi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Manohar Gaikwad', 'rahul.gaikwad1@mitwpu.edu.in', '1129224002', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.gaikwad1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Hemant Shripad Kulkarni', 'hemant.kulkarni@mitwpu.edu.in', '1139219016', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('hemant.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Uday Vilas Jagadale', 'uday.jagdale@mitwpu.edu.in', '1139219025', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('uday.jagdale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swapnil Purushottamrao Goje', 'swapnil.goje@mitwpu.edu.in', '1139219038', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('swapnil.goje@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Madhuri Prakash Joshi', 'madhuri.joshi@mitwpu.edu.in', '1139219044', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('madhuri.joshi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Umesh Kumar B. Dubey', 'umesh.dubey@mitwpu.edu.in', '1139219048', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('umesh.dubey@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Veena Pravin Kshirsagar', 'veena.kshirsagar@mitwpu.edu.in', '1139219049', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('veena.kshirsagar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anuradha Shantanu Kanade', 'anuradha.kanade@mitwpu.edu.in', '1139219050', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anuradha.kanade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jagadish Naik', 'jagadish.naik@mitwpu.edu.in', '1139219051', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('jagadish.naik@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prasanta Kumar Ghosh', 'prasanta.ghosh@mitwpu.edu.in', '1139219058', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('prasanta.ghosh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vandana Aryan Mooss', 'vandana.mooss@mitwpu.edu.in', '1139220020', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('vandana.mooss@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Tejaswini Arun Pachpor', 'tejaswini.pachpor@mitwpu.edu.in', '1139220021', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('tejaswini.pachpor@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shikha Vikrant Gaikwad', 'shikha.gaikwad@mitwpu.edu.in', '1139221010', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('shikha.gaikwad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aavishkar Katti', 'aavishkar.katti@mitwpu.edu.in', '1139221011', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('aavishkar.katti@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manasi Mishra', 'manasi.mishra@mitwpu.edu.in', '1139221014', 'female'::"gender", 'Associate Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('manasi.mishra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nithya N Kutty', 'nithya.kutty@mitwpu.edu.in', '1139221016', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('nithya.kutty@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shilpa Samir Chapadgaonkar', 'shilpa.chapadgaonkar@mitwpu.edu.in', '1139221019', 'female'::"gender", 'Associate Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('shilpa.chapadgaonkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prasad Vivek Joglekar', 'prasad.joglekar@mitwpu.edu.in', '1139221021', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('prasad.joglekar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rehan Deshmukh', 'rehan.deshmukh@mitwpu.edu.in', '1139221027', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('rehan.deshmukh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vikas Jaywant Magar', 'vikas.magar@mitwpu.edu.in', '1139221049', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vikas.magar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jalindar Rambhau Gandal', 'jalindar.gandal@mitwpu.edu.in', '1139222003', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('jalindar.gandal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deobrat Singh', 'deobrat.singh@mitwpu.edu.in', '1139222008', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('deobrat.singh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mukesh Kumar Pal', 'mukesh.pal@mitwpu.edu.in', '1139222019', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('mukesh.pal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Priyanka Kumari', 'priyanka.kumari@mitwpu.edu.in', '1139222020', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('priyanka.kumari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Ashokrao Aher', 'rahul.aher@mitwpu.edu.in', '1139222021', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.aher@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akilbasha A', 'akilbasha.a@mitwpu.edu.in', '1139222039', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('akilbasha.a@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mohammad Idrees Bhat', 'idrees.bhat@mitwpu.edu.in', '1139222040', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('idrees.bhat@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mukul Sacchit Godbole', 'mukul.godbole@mitwpu.edu.in', '1139222041', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('mukul.godbole@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amruta Sameer Naik', 'amruta.naik@mitwpu.edu.in', '1139222042', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('amruta.naik@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Apurv Chaitanya Nellikka', 'apurv.nellikka@mitwpu.edu.in', '1139222051', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('apurv.nellikka@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abdul Nasir Khan', 'abdul.khan@mitwpu.edu.in', '1139222052', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('abdul.khan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Debabrata Saha', 'debabrata.saha@mitwpu.edu.in', '1139222059', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('debabrata.saha@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhishek Singh', 'abhishek.singh@mitwpu.edu.in', '1139222064', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('abhishek.singh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashok Kumar Jaiswal', 'ashok.jaiswal@mitwpu.edu.in', '1139223001', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('ashok.jaiswal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gopal Sureshrao Sakarkar', 'gopal.sakarkar@mitwpu.edu.in', '1139223004', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('gopal.sakarkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Basant Tiwari', 'basant.tiwari@mitwpu.edu.in', '1139223007', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('basant.tiwari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Riddhi Gaurav Panchal', 'riddhi.panchal@mitwpu.edu.in', '1139223012', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('riddhi.panchal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Parineeta Das', 'parineeta.das@mitwpu.edu.in', '1139223014', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('parineeta.das@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Soumava Biswas', 'soumava.biswas@mitwpu.edu.in', '1139223025', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('soumava.biswas@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Soma Mishra', 'soma.mishra@mitwpu.edu.in', '1139223026', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('soma.mishra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sumit Kumar Gupta', 'sumit.gupta@mitwpu.edu.in', '1139223030', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sumit.gupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amit Mishra', 'amit.mishra@mitwpu.edu.in', '1139223031', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('amit.mishra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhijeet Shrikrishna Kokare', 'abhijeet.kokare@mitwpu.edu.in', '1139223033', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('abhijeet.kokare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Apurva Sharma', 'apurva.sharma@mitwpu.edu.in', '1139223034', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('apurva.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sangeetha D', 'sangeetha.d@mitwpu.edu.in', '1139223040', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sangeetha.d@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shruti Shirish Godbole', 'shruti.godbole@mitwpu.edu.in', '1139223041', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shruti.godbole@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pradeep Kumar Tiwari', 'pradeep.tiwari@mitwpu.edu.in', '1139223042', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pradeep.tiwari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dev Kumar Thapa', 'devkumar.thapa@mitwpu.edu.in', '1139223043', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('devkumar.thapa@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kamakshi Keshav Goyal', 'kamakshi.goyal@mitwpu.edu.in', '1139223044', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kamakshi.goyal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Hemlata Gangwar', 'hemlata.gangwar@mitwpu.edu.in', '1139223052', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('hemlata.gangwar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anu Singha', 'anu.singha@mitwpu.edu.in', '1139223066', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anu.singha@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prajkta Bhide', 'prajkta.bhide@mitwpu.edu.in', '1139224002', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('prajkta.bhide@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Varsha Desai', 'varsha.desai@mitwpu.edu.in', '1139224011', 'female'::"gender", 'Professor of Practice', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('varsha.desai@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shrihari Rajendra Dhole', 'shrihari.dhole@mitwpu.edu.in', '1149218012', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('shrihari.dhole@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pallavi Yogendra Rajwade', 'pallavi.rajwade@mitwpu.edu.in', '1149219009', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('pallavi.rajwade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shruti Sunil Nigudkar', 'shruti.nigudkar@mitwpu.edu.in', '1149220007', 'female'::"gender", 'Professor', 'Life Transformations Center'
FROM auth.users WHERE LOWER(email) = LOWER('shruti.nigudkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Yogadrum Kelkar', 'yogadrum.kelkar@mitwpu.edu.in', '1149221004', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('yogadrum.kelkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mithila Arvind Biniwale', 'mithila.biniwale@mitwpu.edu.in', '1149221006', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('mithila.biniwale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Arun Prakash', 'arun.prakash@mitwpu.edu.in', '1149222018', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('arun.prakash@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vandana Kushwaha', 'vandana.kushwaha@mitwpu.edu.in', '1149222019', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('vandana.kushwaha@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shraddha Chandrakant Salvi', 'shraddha.salvi@mitwpu.edu.in', '1149222024', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('shraddha.salvi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shruti Yash Shukla', 'shruti.shukla@mitwpu.edu.in', '1149222025', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('shruti.shukla@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sagar Suryakant Gotkhindikar', 'sagar.gotkhindikar@mitwpu.edu.in', '1149222026', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('sagar.gotkhindikar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Parul Vijayrao Ghole', 'parul.ghole@mitwpu.edu.in', '1149223002', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('parul.ghole@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aquil Ahmad Khan', 'aquil.khan@mitwpu.edu.in', '1149223008', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('aquil.khan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashish Suresh Patil', 'ashish.patil@mitwpu.edu.in', '1159220005', 'male'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('ashish.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Satish Chinchorkar', 'satish.chinchorkar@mitwpu.edu.in', '1159220020', 'male'::"gender", 'Professor of Practice', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('satish.chinchorkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bipin Vishvas Palande', 'bipin.palande@mitwpu.edu.in', '1159221015', 'male'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('bipin.palande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ritu Goel', 'ritu.goel@mitwpu.edu.in', '1159222003', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('ritu.goel@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Waseem Ahmad Khan', 'waseem.khan@mitwpu.edu.in', '1159223004', 'male'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('waseem.khan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sugeeta Upadhyay', 'sugeeta.upadhyay@mitwpu.edu.in', '1159223006', 'female'::"gender", 'Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('sugeeta.upadhyay@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandeep Banerjee', 'sandeep.banerjee@mitwpu.edu.in', '1159223008', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sandeep.banerjee@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sanmit Sanjit Sarkar', 'sanmit.sarkar@mitwpu.edu.in', '1179219004', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('sanmit.sarkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Animesh Mukund Dongare', 'animesh.dongare@mitwpu.edu.in', '1179219009', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('animesh.dongare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Verma', 'rahul.verma@mitwpu.edu.in', '1179220013', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.verma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Madhura Dilip Londhe', 'madhura.londhe@mitwpu.edu.in', '1179221004', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('madhura.londhe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kaustubh Vishwas Yadav', 'kaustubh.yadav@mitwpu.edu.in', '1179221014', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('kaustubh.yadav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishal Dasharath Ghule', 'vishal.ghule@mitwpu.edu.in', '1179221026', 'male'::"gender", 'Associate Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('vishal.ghule@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishakha Vivek Pethkar', 'vishakha.pethkar@mitwpu.edu.in', '1179221030', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('vishakha.pethkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bishnu Prasad Mohapatra', 'bishnu.mohapatra@mitwpu.edu.in', '1179222003', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('bishnu.mohapatra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Satyendra Kumar Prasad', 'satyendra.prasad@mitwpu.edu.in', '1179222006', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('satyendra.prasad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaishali Namdeorao Choudhari', 'vaishali.choudhari@mitwpu.edu.in', '1179222013', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('vaishali.choudhari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anu Nair', 'anu.nair@mitwpu.edu.in', '1179223004', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('anu.nair@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Lakshmi Narayanan Venkataraman', 'laksh.v@mitwpu.edu.in', '1179223005', 'male'::"gender", 'Associate Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('laksh.v@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shankar Mahadevan', 'shankar.mahadevan@mitwpu.edu.in', '1179223007', 'male'::"gender", 'Associate Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('shankar.mahadevan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shreya Bera', 'shreya.bera@mitwpu.edu.in', '1179223008', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('shreya.bera@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinod Sartape', 'vinod.sartape@mitwpu.edu.in', '1179223009', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('vinod.sartape@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Samuel Jacob Kuruvilla', 'samuel.kuruvilla@mitwpu.edu.in', '1179223010', 'male'::"gender", 'Associate Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('samuel.kuruvilla@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vikas Keshav Jadhav', 'vikas.jadhav@mitwpu.edu.in', '1179223011', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('vikas.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aayush Mayank Mishra', 'aayush.mishra@mitwpu.edu.in', '1189220003', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('aayush.mishra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhijeet Ramkrishna Dhere', 'abhijeet.dhere@mitwpu.edu.in', '1189221006', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('abhijeet.dhere@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Balawantrao Deshmukh', 'sachin.deshmukh1@mitwpu.edu.in', '1189222003', 'male'::"gender", 'Associate Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.deshmukh1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anuttama Ghose', 'anuttama.ghose@mitwpu.edu.in', '1189222007', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('anuttama.ghose@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashwani Pant', 'ashwani.pant@mitwpu.edu.in', '1189223001', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('ashwani.pant@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abin Puthupurakizhakathil', 'abin.puthupurakizhakathil@mitwpu.edu.in', '1189223024', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('abin.puthupurakizhakathil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shubhi Trivedi', 'shubhi.trivedi@mitwpu.edu.in', '1189223026', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('shubhi.trivedi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Neha Vishal Agashe', 'neha.agashe@mitwpu.edu.in', '1189223027', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('neha.agashe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akshay Jagdish Ugale', 'akshay.ugale@mitwpu.edu.in', '1189223028', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('akshay.ugale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rushil Chandra', 'rushil.chandra@mitwpu.edu.in', '1189224001', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('rushil.chandra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aditi Mukherjee Chakravorty', 'aditi.chakravorty1@mitwpu.edu.in', '1189224002', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('aditi.chakravorty1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mithila Shelar', 'mithila.shelar@mitwpu.edu.in', '1189224003', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('mithila.shelar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bhushan Rameshwar Shete', 'bhushan.shete@mitwpu.edu.in', '1199219003', 'male'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('bhushan.shete@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prasad Anil Kulkarni', 'prasad.kulkarni@mitwpu.edu.in', '1199219004', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('prasad.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vanisree Trippayya Ramanathan', 'vanisree.ramanathan@mitwpu.edu.in', '1199221003', 'female'::"gender", 'Associate Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vanisree.ramanathan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pankaj Kumbhar', 'pankaj.kumbhar@mitwpu.edu.in', '1199222011', 'male'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('pankaj.kumbhar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shirish Shrikant Waghmare', 'shirish.waghmare@mitwpu.edu.in', '1199222012', 'male'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('shirish.waghmare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Saroj Gorakh Shinde', 'saroj.shinde@mitwpu.edu.in', '1199223004', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('saroj.shinde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dipak Bajarang Abnave', 'dipak.abnave@mitwpu.edu.in', '1199224003', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('dipak.abnave@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swati Bhanudas Mahanoor', 'swati.mahanoor@mitwpu.edu.in', '1209222002', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('swati.mahanoor@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mohit Awasthi', 'mohit.awasthi@mitwpu.edu.in', '1229223001', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('mohit.awasthi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jyotsna Srivastava', 'jyotsna.srivastava@mitwpu.edu.in', '1229224001', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('jyotsna.srivastava@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mukund Gokhale', 'mukund.gokhale@mitwpu.edu.in', '1229224003', 'male'::"gender", 'Adjunct Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('mukund.gokhale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Radhakrishnan Subramaniam', 'radhakrishnan.subramaninan@mitwpu.edu.in', '1229224004', 'male'::"gender", 'Adjunct Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('radhakrishnan.subramaninan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deepak Ranade', 'deepak.ranade@mitwpu.edu.in', '1229224007', 'male'::"gender", 'Professor & Research Guide', 'School of Consciousness'
FROM auth.users WHERE LOWER(email) = LOWER('deepak.ranade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amar Jadhao', 'amar.jadhao@mitwpu.edu.in', '1229224008', 'male'::"gender", 'Adjunct Professor', 'School of Government'
FROM auth.users WHERE LOWER(email) = LOWER('amar.jadhao@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Keerti Pradhan', 'keerti.pradhan@mitwpu.edu.in', '1229224016', 'male'::"gender", 'Professor Emeritus', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('keerti.pradhan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Naga Venkata Rama Sastry Vinjamury', 'rama.sastry@mitwpu.edu.in', '1229224062', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('rama.sastry@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Ambapkar', 'rahul.ambapkar@mitwpu.edu.in', '1229224064', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.ambapkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pravin Satyanarayan Metkewar', 'pravin.metkewar@mitwpu.edu.in', '1229224065', 'male'::"gender", 'Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pravin.metkewar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aparna Kulkarni', 'aparna.kulkarni1@mitwpu.edu.in', '1229224069', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('aparna.kulkarni1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Madhumita Mukherjee', 'madhumita.mukherjee@mitwpu.edu.in', '1229224076', 'female'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('madhumita.mukherjee@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Devendra Joshi', 'devendra.joshi1@mitwpu.edu.in', '1229224078', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('devendra.joshi1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dhaarna Singh Rathore', 'dhaarna.rathore@mitwpu.edu.in', '1229224080', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('dhaarna.rathore@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akshita Sparshneel Chanchlani', 'akshita.chanchlani@mitwpu.edu.in', '1229224084', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('akshita.chanchlani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Falguni Vyas', 'falguni.vyas@mitwpu.edu.in', '1229224085', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('falguni.vyas@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kausik Bhattacharyya', 'kausik.bhattacharyya@mitwpu.edu.in', '1229224091', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('kausik.bhattacharyya@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Hetvi Trada', 'hetvi.trada@mitwpu.edu.in', '1229224093', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('hetvi.trada@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Harshal Anil Salunkhe', 'harshal.salunkhe@mitwpu.edu.in', '1229224094', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('harshal.salunkhe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nikhil Vijaykumar Soniminde', 'nikhil.soniminde@mitwpu.edu.in', '1229224095', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nikhil.soniminde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amit Ambar Gupta', 'amit.gupta1@mitwpu.edu.in', '1229224097', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('amit.gupta1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nikhil K S', 'nikhil.ks@mitwpu.edu.in', '1229224104', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('nikhil.ks@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Balagangadhar Reddy Kandula', 'balagangadhar.reddy@mitwpu.edu.in', '1229224105', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('balagangadhar.reddy@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Minakshee Deelip Bari', 'minakshee.bari@mitwpu.edu.in', '1229224108', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('minakshee.bari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Borah', 'rahul.borah@mitwpu.edu.in', '1229224109', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.borah@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rohit Kumar Sharma', 'rohit.sharma@mitwpu.edu.in', '1229224112', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('rohit.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Parveen Kumar', 'parveen.kumar@mitwpu.edu.in', '1229224113', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('parveen.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shivam Upadhyay', 'shivam.upadhyay@mitwpu.edu.in', '1229224114', 'male'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('shivam.upadhyay@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Santosh Shamarao Patil', 'santosh.patil@mitwpu.edu.in', '1229224115', 'male'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('santosh.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kulamala Vinod Kumar', 'kulamala.kumar@mitwpu.edu.in', '1229224118', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kulamala.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dibyangana Chakraborty', 'dibyangana.chakraborty@mitwpu.edu.in', '1229224120', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('dibyangana.chakraborty@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinay Vishnu Munde', 'vinay.munde@mitwpu.edu.in', '1229224122', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('vinay.munde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaidyanatha Gundlupet', 'vaidyanatha.gundlupet@mitwpu.edu.in', '1229224125', 'male'::"gender", 'Associate Professor & Associate Dean', 'Office of Dean Academics'
FROM auth.users WHERE LOWER(email) = LOWER('vaidyanatha.gundlupet@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aaditi Ameya Khare', 'aaditi.khare@mitwpu.edu.in', '1229224126', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('aaditi.khare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shanu Gupta', 'shanu.gupta@mitwpu.edu.in', '1229224129', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('shanu.gupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vikram Shete', 'vikram.shete@mitwpu.edu.in', '1229224130', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('vikram.shete@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shrirang Ramdas Chaudhari', 'shrirang.chaudhari@mitwpu.edu.in', '1229224131', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('shrirang.chaudhari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Arun Naik', 'sachin.naik@mitwpu.edu.in', '1229224132', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.naik@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Navnath Lahu Shete', 'navnath.shete@mitwpu.edu.in', '1229224135', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('navnath.shete@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anusha Raghavendra Pai', 'anusha.pai@mitwpu.edu.in', '1229224136', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anusha.pai@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rucha Deshpande', 'rucha.deshpande@mitwpu.edu.in', '1229224137', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('rucha.deshpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nuvita Kalra', 'nuvita.kalra@mitwpu.edu.in', '1229224142', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('nuvita.kalra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shubhika Dilip Malara', 'shubhika.malara@mitwpu.edu.in', '1229224149', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('shubhika.malara@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ruchika Raj Saxena', 'ruchika.saxena@mitwpu.edu.in', '1229224150', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('ruchika.saxena@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhishek Dutta', 'abhishek.dutta@mitwpu.edu.in', '1229224153', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('abhishek.dutta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaishnavi Unmesh Andhare', 'vaishnavi.andhare@mitwpu.edu.in', '1229224155', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('vaishnavi.andhare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akash Dixit', 'akash.dixit@mitwpu.edu.in', '1229224156', 'male'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('akash.dixit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anamika Singh', 'anamika.singh@mitwpu.edu.in', '1229224157', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('anamika.singh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rayala Swetha', 'rayala.swetha@mitwpu.edu.in', '1229224159', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rayala.swetha@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aachal Pitamber Taywade', 'aachal.taywade@mitwpu.edu.in', '1229224161', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('aachal.taywade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pallavi Vivekanand Choudhary', 'pallavi.choudhary@mitwpu.edu.in', '1229224162', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('pallavi.choudhary@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Soubir Das', 'soubir.das@mitwpu.edu.in', '1229224163', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('soubir.das@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pallavi Parag Kadam', 'pallavi.kadam@mitwpu.edu.in', '1229224164', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pallavi.kadam@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rupali Sagar Chavan', 'rupali.chavan@mitwpu.edu.in', '1229224165', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rupali.chavan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nilay Kumar Pal', 'nilay.pal@mitwpu.edu.in', '1229224166', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nilay.pal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishakha Sharma', 'vishakha.sharma@mitwpu.edu.in', '1229224168', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('vishakha.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bandhali Dutta', 'bandhali.dutta@mitwpu.edu.in', '1229224169', 'female'::"gender", 'Associate Professor of Practice', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('bandhali.dutta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Garima Chaudhary', 'garima.chaudhary@mitwpu.edu.in', '1229224170', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('garima.chaudhary@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rohit Sambhajee Borachate', 'rohit.borachate@mitwpu.edu.in', '1229224173', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('rohit.borachate@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Raja Bavani', 'raja.bavani@mitwpu.edu.in', '1229224180', 'male'::"gender", 'Professor of Practice', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('raja.bavani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vijay Kumar Kalyani', 'vijaykumar.Kalyani@mitwpu.edu.in', '1229224181', 'male'::"gender", 'Professor of Practice', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('vijaykumar.Kalyani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Smriti Tanvani', 'smriti.tanvani@mitwpu.edu.in', '1229224183', 'female'::"gender", 'Assistant Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('smriti.tanvani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vikrant Sopan Yadav', 'vikrant.yadav@mitwpu.edu.in', '1229224184', 'male'::"gender", 'Associate Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('vikrant.yadav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mandar Dattaram Bopardikar', 'mandar.bopardikar@mitwpu.edu.in', '1229224185', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('mandar.bopardikar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Lipsa Mishra', 'lipsa.mishra@mitwpu.edu.in', '1229224188', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('lipsa.mishra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bishnudeo Roy', 'bishnudeo.roy@mitwpu.edu.in', '1229224195', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('bishnudeo.roy@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sachin Ashokrao Harle', 'sachin.harle@mitwpu.edu.in', '1229224196', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('sachin.harle@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Maithili Malpure', 'maithili.malpure@mitwpu.edu.in', '1229224197', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('maithili.malpure@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Waseem Khan', 'waseem.khan1@mitwpu.edu.in', '1229224198', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('waseem.khan1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Punam Tushar Chaudhari', 'punam.chaudhari@mitwpu.edu.in', '1229224199', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('punam.chaudhari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Alexander Hankey', 'alexander.hankey@mitwpu.edu.in', '1229224200', 'male'::"gender", 'Professor of Practice', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('alexander.hankey@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Suchitra Mahesh Renguntwar', 'suchitra.renguntwar@mitwpu.edu.in', '1229224203', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('suchitra.renguntwar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shitalkumar Pathak', 'shitalkumar.pathak@mitwpu.edu.in', '1229224205', 'male'::"gender", 'Professor of Practice', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shitalkumar.pathak@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nidhi Gupta', 'nidhi.gupta@mitwpu.edu.in', '1229224206', 'female'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('nidhi.gupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mangeshkumar Rajkumar Shendkar', 'mangesh.shendkar@mitwpu.edu.in', '1229224208', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('mangesh.shendkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vaibhav Kathavate', 'vaibhav.kathavate@mitwpu.edu.in', '1229224209', 'male'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('vaibhav.kathavate@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Trupti Rakesh Bhosale', 'trupti.bhosale@mitwpu.edu.in', '1229224241', 'female'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('trupti.bhosale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mandar Sadanand Sapre', 'mandar.sapre@mitwpu.edu.in', '1229224242', 'male'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('mandar.sapre@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rutwick Mukeshbhai Vyas', 'rutwick.vyas@mitwpu.edu.in', '1229224243', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('rutwick.vyas@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anita Kumari', 'anita.kumari1@mitwpu.edu.in', '1229224245', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('anita.kumari1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Saloni Kumar', 'saloni.kumar@mitwpu.edu.in', '1229224246', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('saloni.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kunal Modak', 'kunal.modak@mitwpu.edu.in', '1229224247', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kunal.modak@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Satyajeet Abasaheb Nagargoje', 'satyajeet.nagargoje@mitwpu.edu.in', '1229224249', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('satyajeet.nagargoje@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manasi Yogesh Gokhale', 'manasi.gokhale@mitwpu.edu.in', '1229224252', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('manasi.gokhale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kiran Dashrath Nagare', 'kiran.nagare@mitwpu.edu.in', '1229224253', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('kiran.nagare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pallavi Gaurav Adke', 'pallavi.adke@mitwpu.edu.in', '1229224255', 'female'::"gender", 'Assistant Professor', 'Research and Development'
FROM auth.users WHERE LOWER(email) = LOWER('pallavi.adke@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Purna Kumari Pechetty', 'purna.pechetty@mitwpu.edu.in', '1229224256', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('purna.pechetty@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Udit Kumar Sahu', 'udit.sahu@mitwpu.edu.in', '1229224257', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('udit.sahu@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prashantanu Mahapatra', 'prashantanu.mahapatra@mitwpu.edu.in', '1229224258', 'male'::"gender", 'Professor of Practice', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('prashantanu.mahapatra@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Raghavendra Mukundraj Chate', 'raghavendra.chate@mitwpu.edu.in', '1229224259', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('raghavendra.chate@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vishvajeet Nagargoje', 'vishvajeet.nagargoje@mitwpu.edu.in', '1229224260', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('vishvajeet.nagargoje@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ajay Kumar Sahu', 'ajay.sahu@mitwpu.edu.in', '1229224262', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ajay.sahu@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Goutam Bhaskar', 'goutam.bhaskar@mitwpu.edu.in', '1229224263', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('goutam.bhaskar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Radnyi Godase', 'radnyi.godase@mitwpu.edu.in', '1229224264', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('radnyi.godase@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Barnali Banerjee', 'barnali.banerjee@mitwpu.edu.in', '1229224265', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('barnali.banerjee@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Suryakant Janardan Karande', 'suryakant.karande@mitwpu.edu.in', '1229224266', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('suryakant.karande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Prince Dubey', 'prince.dubey@mitwpu.edu.in', '1229224267', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('prince.dubey@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swapnil Sonawane', 'swapnil.sonawane@mitwpu.edu.in', '1229224268', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('swapnil.sonawane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Asmita Abhijeet Gaikwad', 'asmita.gaikwad1@mitwpu.edu.in', '1229224269', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('asmita.gaikwad1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhijit Bhausaheb Bendre', 'abhijit.bendre@mitwpu.edu.in', '1229224271', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('abhijit.bendre@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Asish Bishnu Saha', 'asish.saha@mitwpu.edu.in', '1229224272', 'male'::"gender", 'Professor of Practice', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('asish.saha@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Deepali Nitin Sonawane', 'deepali.sonawane@mitwpu.edu.in', '1229224274', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('deepali.sonawane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Priyanka Rajmane', 'priyanka.rajmane@mitwpu.edu.in', '1229224275', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('priyanka.rajmane@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Raj Agarwal', 'raj.agarwal1@mitwpu.edu.in', '1229224276', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('raj.agarwal1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kiran Prakash Shejale', 'kiran.shejale@mitwpu.edu.in', '1229224277', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kiran.shejale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashish Ashok Kulkarni', 'ashish.kulkarni@mitwpu.edu.in', '1229224278', 'male'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ashish.kulkarni@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shital Arun Kakad', 'shital.kakad@mitwpu.edu.in', '1229224279', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shital.kakad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kona Divyashree Rao', 'divyashree.rao@mitwpu.edu.in', '1229224280', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('divyashree.rao@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pranali Digambar Dahiwal', 'pranali.dahiwal@mitwpu.edu.in', '1229224281', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('pranali.dahiwal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sarika Shivanand Patil', 'sarika.patil@mitwpu.edu.in', '1229224282', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sarika.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rakhi Ashutosh Khedkar', 'rakhi.khedkar@mitwpu.edu.in', '1229224283', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rakhi.khedkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Murtuza Shabbribhai Dholkawala', 'murtuza.dholkawala@mitwpu.edu.in', '1229224284', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('murtuza.dholkawala@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akshat Bhargava', 'akshat.bhargava@mitwpu.edu.in', '1229224285', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('akshat.bhargava@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kumar Abhijeet Raj', 'abhijeet.raj@mitwpu.edu.in', '1229224287', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('abhijeet.raj@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Bharat Bhavu Santhalia', 'bharat.santhalia@mitwpu.edu.in', '1229224289', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('bharat.santhalia@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anjali Adnyan Meshram', 'anjali.meshram@mitwpu.edu.in', '1229224290', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anjali.meshram@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashok Shripati Deokar', 'ashok.deokar@mitwpu.edu.in', '1229224292', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ashok.deokar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Renuka Shailesh Deshpande', 'renuka.deshpande@mitwpu.edu.in', '1229224293', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('renuka.deshpande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Esha Bansal', 'esha.bansal@mitwpu.edu.in', '1229224294', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('esha.bansal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amruta Aphale', 'amruta.aphale1@mitwpu.edu.in', '1229224295', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('amruta.aphale1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sonali Potadar', 'sonali.potadar@mitwpu.edu.in', '1229224296', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sonali.potadar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kiran Bidua', 'kiran.bidua@mitwpu.edu.in', '1229224297', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('kiran.bidua@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Manish Kumar Sharma', 'manish.sharma@mitwpu.edu.in', '1229224298', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('manish.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Saimil Patel', 'saimil.patel@mitwpu.edu.in', '1229224299', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('saimil.patel@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shantaram Dond', 'shantaram.dond@mitwpu.edu.in', '1229224300', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shantaram.dond@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashwini Prashant Bagkar', 'ashwini.bagkar@mitwpu.edu.in', '1229224301', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('ashwini.bagkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Tejaswini Sanjay Bharati', 'tejaswini.bharati@mitwpu.edu.in', '1229224302', 'female'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('tejaswini.bharati@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kaustubh Arvind Sontakke', 'kaustubh.sontakke@mitwpu.edu.in', '1229224303', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('kaustubh.sontakke@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aparna Atul Junnarkar', 'aparna.junnarkar@mitwpu.edu.in', '1229224306', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('aparna.junnarkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashwini Vinayak Zadgaonkar', 'ashwini.zadgaonkar@mitwpu.edu.in', '1229224308', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ashwini.zadgaonkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shailendrakumar Kale', 'shailendrakumar.kale@mitwpu.edu.in', '1229224309', 'male'::"gender", 'Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('shailendrakumar.kale@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Santosh Haribhau Aghav', 'santosh.aghav@mitwpu.edu.in', '1229224311', 'male'::"gender", 'Professor & Dean', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('santosh.aghav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Roshan Kumar', 'roshan.kumar@mitwpu.edu.in', '1229224313', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('roshan.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ankita Anil Kotalwar', 'ankita.kotalwar@mitwpu.edu.in', '1229224314', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('ankita.kotalwar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akanksha Tandon', 'akanksha.tandon@mitwpu.edu.in', '1229224315', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('akanksha.tandon@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Suvarna Sharma', 'suvarna.sharma@mitwpu.edu.in', '1229224316', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('suvarna.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ajendra Singh', 'Ajendra.Singh@mitwpu.edu.in', '1229224317', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('Ajendra.Singh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shahrukh Mushtaq Sayyed', 'Shahrukh.Sayyed@mitwpu.edu.in', '1229224318', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('Shahrukh.Sayyed@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pallavi Jaideep Pandit', 'pallavi.pandit@mitwpu.edu.in', '1229224320', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('pallavi.pandit@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ruchika Khetarpal', 'ruchika.khetarpal@mitwpu.edu.in', '1229224355', 'female'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('ruchika.khetarpal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mahesh Mukund Kulkarni', 'mahesh.kulkarni1@mitwpu.edu.in', '1229224356', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('mahesh.kulkarni1@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shraddha Shah', 'shraddha.shah@mitwpu.edu.in', '1229224358', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('shraddha.shah@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ramkrishna Manatkar', 'ramkrishna.manatkar@mitwpu.edu.in', '1229224359', 'male'::"gender", 'Professor of Practice', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('ramkrishna.manatkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Aniruddh Gupta', 'aniruddh.gupta@mitwpu.edu.in', '1229224360', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('aniruddh.gupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sagar H Mohite', 'sagar.mohite@mitwpu.edu.in', '1229224362', 'male'::"gender", 'Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sagar.mohite@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Meenal Kaustubh Jabde', 'meenal.jabde@mitwpu.edu.in', '1229224365', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('meenal.jabde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Roshan Anant Gangurde', 'roshan.gangurde@mitwpu.edu.in', '1229224366', 'male'::"gender", 'Associate Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('roshan.gangurde@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amir Shikalgar', 'amir.shikalgar@mitwpu.edu.in', '1229224367', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('amir.shikalgar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rahul Roy', 'rahul.roy@mitwpu.edu.in', '1229224370', 'male'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('rahul.roy@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Suman Rawat', 'suman.rawat@mitwpu.edu.in', '1229224371', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('suman.rawat@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nilesh Gajanan Bajad', 'nilesh.bajad@mitwpu.edu.in', '1229224372', 'male'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nilesh.bajad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Harshit Pratap Singh', 'harshit.singh@mitwpu.edu.in', '1229224373', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('harshit.singh@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amit Kumar', 'amitkumar.dwivedi@mitwpu.edu.in', '1229224374', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('amitkumar.dwivedi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Alamgir Sani', 'alamgir.sani@mitwpu.edu.in', '1229224375', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('alamgir.sani@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Alok Kumar Yadav', 'alok.yadav@mitwpu.edu.in', '1229224376', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('alok.yadav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Parimal Sharad Bhambare', 'parimal.bhambare@mitwpu.edu.in', '1229224377', 'male'::"gender", 'Associate Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('parimal.bhambare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Urvashi Makkar', 'urvashi.makkar@mitwpu.edu.in', '1229224380', 'female'::"gender", 'Professor & Dean', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('urvashi.makkar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vinod Shastri', 'vinod.shastri@mitwpu.edu.in', '1229224382', 'male'::"gender", 'Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('vinod.shastri@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shalaka Tatyasaheb Patil', 'shalaka.patil@mitwpu.edu.in', '1229224383', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('shalaka.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Jehath Syed', 'jehath.syed@mitwpu.edu.in', '1229224384', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('jehath.syed@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Yadavraj Phad', 'yadavraj.phad@mitwpu.edu.in', '1229224385', 'male'::"gender", 'Adjunct Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('yadavraj.phad@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rashmi Murgendra Ashtagi', 'rashmi.ashtagi@mitwpu.edu.in', '1229224389', 'female'::"gender", 'Associate Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rashmi.ashtagi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mutum Yoiremba', 'mutum.yoiremba@mitwpu.edu.in', '1229224391', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('mutum.yoiremba@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Racheal Nikita Sharma', 'racheal.sharma@mitwpu.edu.in', '1229224392', 'female'::"gender", 'Assistant Professor', 'School of Health Sciences and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('racheal.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Meenakshi Shankar Iyer', 'meenakshi.iyer@mitwpu.edu.in', '1229224393', 'female'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('meenakshi.iyer@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gallipally Srisailam', 'gallipally.srisailam@mitwpu.edu.in', '1229224394', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('gallipally.srisailam@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sukhmeet Kaur', 'sukhmeet.kaur@mitwpu.edu.in', '1229224395', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('sukhmeet.kaur@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Pranav Sharad Kayande', 'pranav.kayande@mitwpu.edu.in', '1229224397', 'male'::"gender", 'Associate Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('pranav.kayande@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Suman Devadula', 'suman.devadula@mitwpu.edu.in', '1229224399', 'male'::"gender", 'Professor & Dean', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('suman.devadula@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Surender Kaur', 'surender.kaur@mitwpu.edu.in', '1229224400', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('surender.kaur@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Maisam Ali', 'maisam.ali@mitwpu.edu.in', '1229224404', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('maisam.ali@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Namrata Sathe', 'namrata.sathe@mitwpu.edu.in', '1229224405', 'female'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('namrata.sathe@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Shiv Kumar Tripathi', 'shiv.tripathi@mitwpu.edu.in', '1229224406', 'male'::"gender", 'Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('shiv.tripathi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sayali Yuvraj Nikam', 'sayali.nikam@mitwpu.edu.in', '1229224408', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sayali.nikam@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Vijayashri Machindra Gurme', 'vijayashri.gurme@mitwpu.edu.in', '1229224410', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('vijayashri.gurme@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Amol Bhide', 'amol.bhide@mitwpu.edu.in', '1229224411', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('amol.bhide@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Abhijith B', 'abhijith.b@mitwpu.edu.in', '1229224413', 'male'::"gender", 'Assistant Professor', 'School of Liberal Arts'
FROM auth.users WHERE LOWER(email) = LOWER('abhijith.b@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Anant Srivastava', 'anant.srivastava@mitwpu.edu.in', '1229224414', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('anant.srivastava@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sushil Kumar Gupta', 'sushil.gupta@mitwpu.edu.in', '1229224418', 'male'::"gender", 'Associate Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('sushil.gupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nikhilesh Joardar', 'nikhilesh.joardar@mitwpu.edu.in', '1229224419', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('nikhilesh.joardar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Santosh Jaybhay', 'santosh.jaybhay@mitwpu.edu.in', '1229224420', 'male'::"gender", 'Associate Professor', 'School of Law'
FROM auth.users WHERE LOWER(email) = LOWER('santosh.jaybhay@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Priya Navnath Nagargoje', 'priya.nagargoje@mitwpu.edu.in', '1229224423', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('priya.nagargoje@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Dipalee Bhalerao Borse', 'dipalee.borse@mitwpu.edu.in', '1229224425', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('dipalee.borse@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kirtikumar Ramesh Kondhare', 'kirtikumar.kondhare@mitwpu.edu.in', '1229224428', 'male'::"gender", 'Assistant Professor', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('kirtikumar.kondhare@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rachana vasant Chavan', 'rachana.chavan@mitwpu.edu.in', '1229224429', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('rachana.chavan@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swati Vilas Jadhav', 'swati.jadhav@mitwpu.edu.in', '1229224444', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('swati.jadhav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Narendra Laxman Mathakari', 'narendra.mathakari@mitwpu.edu.in', '1229224469', 'male'::"gender", 'Professor of Practice', 'School of Science and Environmental studies'
FROM auth.users WHERE LOWER(email) = LOWER('narendra.mathakari@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akashdeep S. Sharma', 'akashdeep.sharma@mitwpu.edu.in', '1229224470', 'male'::"gender", 'Assistant Professor', 'School of Design'
FROM auth.users WHERE LOWER(email) = LOWER('akashdeep.sharma@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Akshay Ramesh Bura', 'akshay.bura@mitwpu.edu.in', '1229224471', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('akshay.bura@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Yogesh Suresh Sumant', 'yogesh.sumant@mitwpu.edu.in', '1229224472', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('yogesh.sumant@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Santushti Santosh Betgeri', 'santushti.betgeri@mitwpu.edu.in', '1229224473', 'female'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('santushti.betgeri@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rupali A Kanade', 'rupali.kanade@mitwpu.edu.in', '1229224476', 'female'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('rupali.kanade@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Brijesh Kumar', 'brijesh.kumar@mitwpu.edu.in', '1229224477', 'male'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('brijesh.kumar@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rachit Agarwal', 'rachit.agarwal@mitwpu.edu.in', '1229224478', 'male'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('rachit.agarwal@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Atanu Hazarika', 'atanu.hazarika@mitwpu.edu.in', '1229224479', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('atanu.hazarika@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Gaurav Saxena', 'gaurav.saxena@mitwpu.edu.in', '1229224486', 'male'::"gender", 'Associate Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('gaurav.saxena@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Swapnil Mahesh Gupta', 'swapnil.gupta@mitwpu.edu.in', '1229224487', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('swapnil.gupta@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sandhya Rajesh Mathapati', 'sandhya.mathapati@mitwpu.edu.in', '1229224488', 'female'::"gender", 'Assistant Professor', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('sandhya.mathapati@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Kishen R Patil', 'kishen.patil@mitwpu.edu.in', '1229224490', 'male'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('kishen.patil@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Ashish Ramesh Mohture', 'ashish.mohture@mitwpu.edu.in', '1229224492', 'male'::"gender", 'Associate Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('ashish.mohture@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Rushabh Lalit Trivedi', 'rushabh.trivedi@mitwpu.edu.in', '1229224495', 'male'::"gender", 'Assistant Professor', 'School of Leadership'
FROM auth.users WHERE LOWER(email) = LOWER('rushabh.trivedi@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mitrajit Biswas', 'mitrajit.biswas@mitwpu.edu.in', '1229224496', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('mitrajit.biswas@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Milan Lalbahdur Yadav', 'milan.yadav@mitwpu.edu.in', '1229224498', 'female'::"gender", 'Assistant Professor', 'School of Economics and Commerce'
FROM auth.users WHERE LOWER(email) = LOWER('milan.yadav@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Sagar Sambhaji Apune', 'Sagar.apune@mitwpu.edu.in', '1229224760', 'male'::"gender", 'Assistant Professor', 'School of Computer Engineering & Technology'
FROM auth.users WHERE LOWER(email) = LOWER('Sagar.apune@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Mukul Vinayak Hoshing', 'mukul.hoshing@mitwpu.edu.in', '1229224761', 'male'::"gender", 'Assistant Professor', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('mukul.hoshing@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Datta Bhalchandra Dandge', 'datta.dandge@mitwpu.edu.in', 'NE374', 'male'::"gender", 'Professor Emeritus', 'School of Engineering and Technology'
FROM auth.users WHERE LOWER(email) = LOWER('datta.dandge@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, name, email, university_id, gender, designation, department)
SELECT id, 'Nishikant Borge', 'nishikant.borge@mitwpu.edu.in', 'NE402', 'male'::"gender", 'Professor of Practice', 'School of Business'
FROM auth.users WHERE LOWER(email) = LOWER('nishikant.borge@mitwpu.edu.in')
ON CONFLICT (id) DO NOTHING;

-- Check total count
SELECT 'Total profiles created:' as status, COUNT(*) as count FROM profiles;