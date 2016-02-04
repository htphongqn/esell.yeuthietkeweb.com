using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Data.SqlClient;
using Model;

namespace Controller
{
    public class AsyntaskFunction
    {
        Home index = new Home();
        private String _taskprogress;
        private AsyncTaskDelegate _dlgt;
        List<ESHOP_NEW> _listPro;
        // Create delegate. 
        protected delegate void AsyncTaskDelegate();

        public String GetAsyncTaskProgress()
        {
            return _taskprogress;
        }
        public List<ESHOP_NEW> getListPro()
        {
            return _listPro;
        }
        public void DoTheAsyncTask()
        {
            // Introduce an artificial delay to simulate a delayed  
            // asynchronous task. Make this greater than the  
            // AsyncTimeout property.
            Thread.Sleep(TimeSpan.FromSeconds(5.0));
        }

        // Define the method that will get called to 
        // start the asynchronous task. 
        public IAsyncResult OnBegin(object sender, EventArgs e,
            AsyncCallback cb, object extraData)
        {
            _listPro = index.Loadindex(1, 2, 10);
            foreach (var i in _listPro)
            {
                _taskprogress = "Beginning async task."+i.NEWS_TITLE;
                _dlgt = new AsyncTaskDelegate(DoTheAsyncTask);
            }
         
            IAsyncResult result = _dlgt.BeginInvoke(cb, _listPro);

            return result;
        }

        // Define the method that will get called when 
        // the asynchronous task is ended. 
        public void OnEnd(IAsyncResult ar)
        {
            _taskprogress = "Asynchronous task completed.";
            _dlgt.EndInvoke(ar);
        }

        // Define the method that will get called if the task 
        // is not completed within the asynchronous timeout interval. 
        public void OnTimeout(IAsyncResult ar)
        {
            _taskprogress = "Ansynchronous task failed to complete " +
                "because it exceeded the AsyncTimeout parameter.";
        }
    }
}
