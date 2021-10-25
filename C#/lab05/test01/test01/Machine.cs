using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Management; 

namespace test01 {
    class Machine {

        public static string[] getTestDriveInfo() {
            DriveInfo[] all = DriveInfo.GetDrives();

            string[] res = new string[all.Length];

            for (int i = 0; i < all.Length; ++i) {
                res[i] = all[i].Name + "---" + all[i].DriveType;
                if (all[i].IsReady) {
                    res[i] = res[i] + ", 容量:" + (all[i].TotalSize / 1024 / 1024) + "MB, 可用空间大小:" + (all[i].TotalFreeSpace / 1024 / 1024) + "MB";
                } else {
                    res[i] = res[i] + "没有就绪";
                }

                Console.WriteLine(res[i]);
            }

            return res;
        }

        public static string getCpuId() {
            string res = "";
            ManagementClass mc = new ManagementClass("Win32_Processor");
            ManagementObjectCollection moc = mc.GetInstances(); 
            foreach (ManagementObject mo in moc) {
                res = mo.Properties["ProcessorId"].Value.ToString();
            }
            moc = null;
            mc = null;
            return res;
        }

        public static string getIP() {
            string st = ""; 
                ManagementClass mc = new ManagementClass("Win32_NetworkAdapterConfiguration"); 
                ManagementObjectCollection moc = mc.GetInstances(); 
                foreach (ManagementObject mo in moc) 
                { 
                    if ((bool)mo["IPEnabled"] == true) 
                    { 
                        //st=mo["IpAddress"].ToString(); 
                        System.Array ar; 
                        ar = (System.Array)(mo.Properties["IpAddress"].Value); 
                        st = ar.GetValue(0).ToString(); 
                        break; 
                    } 
                } 
                moc = null; 
                mc = null; 
                return st; 
        }

    }
}
