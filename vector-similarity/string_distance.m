#Uses Levenshtein distance to compute string similarity
#If a string is too similar to the target displays an alert
#Inspired by: https://www.limacharlie.io/blog/2019/1/16/levenshtein-distance-as-a-defence-against-spear-phishing

#REQUIREMENTS:
#on Octave, requires statistics package: pkg load strings

target_domain = 'example.local'
line = '';
fid = fopen('domain_list.txt','r');
if (fid < 0) 
printf('Error:could not access file\n')
else
while feof(fid) == 0
line = fgetl(fid);
string_distance = editdistance(target_domain,line);
if string_distance < 2
printf('WARNING: found new domain %s, too similar to target domain\n',line)
endif
end
fclose(fid);
end;