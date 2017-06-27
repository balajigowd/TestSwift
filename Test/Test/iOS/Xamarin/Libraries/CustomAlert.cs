using System;
using UIKit;

namespace AlertCustomClass
{
	public class CustomAlert
	{
		public CustomAlert()
		{
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="objAlertDetails">Object alert details, With this param All Alert Details have to be provided, those are viewController object from which alert to be displayed, Alert Title, 
		/// Alert Message, Button Title</param>
		/// <param name="buttonTitle">Alert Button Title.</param>
		/// <param name="buttonAction">Alert Button action.</param>

		public static void showAlertWithButton(customAlertDetails objAlertDetails, string buttonTitle, Action buttonAction)
		{
			UIAlertController objAlert = UIAlertController.Create(objAlertDetails.alertTitle, objAlertDetails.alertMessage, UIAlertControllerStyle.Alert);
			UIAlertAction objActionOK = UIAlertAction.Create(buttonTitle, UIAlertActionStyle.Default, (obj) =>
			{
				buttonAction();
			});
			objAlert.AddAction(objActionOK);
			objAlertDetails.alertFromVC.PresentViewController(objAlert, true, null);
		}

		/// <summary>
		/// Shows the alert to confirm.
		/// </summary>
		/// <param name="objAlertDetails">Object alert details, With this param All Alert Details have to be provided, those are viewController object from which alert to be displayed, Alert Title, 
		/// Alert Message, Button Title</param>
		/// <param name="buttonCancelTitle">Button cancel title.</param>
		/// <param name="buttonCancelAction">Button cancel action.</param>
		/// <param name="buttonAcceptTitle">Button accept title.</param>
		/// <param name="buttonAcceptAction">Button accept action.</param>
		public static void showAlertToConfirm(customAlertDetails objAlertDetails, string buttonCancelTitle, Action buttonCancelAction, string buttonAcceptTitle, Action buttonAcceptAction)
		{
			UIAlertController objAlert = UIAlertController.Create(objAlertDetails.alertTitle, objAlertDetails.alertMessage, UIAlertControllerStyle.Alert);
			UIAlertAction objActionCancel = UIAlertAction.Create(buttonCancelTitle, UIAlertActionStyle.Cancel, (obj) =>
			{
				buttonAcceptAction();
			});
			objAlert.AddAction(objActionCancel);

			UIAlertAction objActionAccept = UIAlertAction.Create(buttonAcceptTitle, UIAlertActionStyle.Default, (obj) =>
			{
				buttonAcceptAction();
			});
			objAlert.AddAction(objActionAccept);
			objAlertDetails.alertFromVC.PresentViewController(objAlert, true, null);
		}
	}

	/// <summary>
	/// Custom alert details.
	/// </summary>
	public class customAlertDetails
	{
		public UIViewController alertFromVC;
		public string alertTitle;
		public string alertMessage;

		public customAlertDetails(UIViewController objAlertFromVC, string ObjAlertTitle, string objAlertMessage)
		{
			alertFromVC = objAlertFromVC;
			alertTitle = ObjAlertTitle;
			alertMessage = objAlertMessage;
		}
	}
}
