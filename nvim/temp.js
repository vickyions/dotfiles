let fs = require("fs");
let data = fs.readFileSync(0, "utf-8");
let idx = 0;
data = data.split("\n");

function readLine() {
	idx++;
	return data[idx - 1];
}

// -------- Do NOT edit anything above this line ----------
// Use readLine() for taking input, it will read one line of from the input  and is stored in string format
let size = parseInt(readLine());
let nums = [];
let indices = [];

for (let i = 0; i < size; i++) {
	nums.push(parseInt(readLine()));	
}

for (let i = 0; i < size; i++) {
	indices.push(parseInt(readLine()));	
}

//console.log(nums, indices);

let target = [];

for (let i = 0; i < size; i++) {
	if (target[indices[i]] === undefined) {
		target[indices[i]] = nums[i];
	} else {
		let temp = [];

		for (let j = indices[i]; j < size; j++) {
				temp.push(target[j]);	
		}
		
		target[indices[i]] = nums[i];
		let q = 0;
		for (let p = indices[i] + 1; p < size; p++) {
			if(q < temp.length){
				target[p] = temp[q];
				q++;
			}
		}
	}
}
for (let i = 0; i< size;i++){
console.log(target[i]);
}
