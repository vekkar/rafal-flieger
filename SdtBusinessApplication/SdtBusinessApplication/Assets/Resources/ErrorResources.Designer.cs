﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SdtBusinessApplication
{
    using System;


    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class ErrorResources
    {

        private static global::System.Resources.ResourceManager resourceMan;

        private static global::System.Globalization.CultureInfo resourceCulture;

        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal ErrorResources()
        {
        }

        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager
        {
            get
            {
                if (object.ReferenceEquals(resourceMan, null))
                {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("SdtBusinessApplication.Assets.Resources.ErrorResources", typeof(ErrorResources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }

        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture
        {
            get
            {
                return resourceCulture;
            }
            set
            {
                resourceCulture = value;
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to A user name for that e-mail address already exists. Please enter a different e-mail address..
        /// </summary>
        public static string CreateUserStatusDuplicateEmail
        {
            get
            {
                return ResourceManager.GetString("CreateUserStatusDuplicateEmail", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to User name already exists. Please enter a different user name..
        /// </summary>
        public static string CreateUserStatusDuplicateUserName
        {
            get
            {
                return ResourceManager.GetString("CreateUserStatusDuplicateUserName", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator..
        /// </summary>
        public static string CreateUserStatusFailed
        {
            get
            {
                return ResourceManager.GetString("CreateUserStatusFailed", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to The user name or password is incorrect.
        /// </summary>
        public static string ErrorBadUserNameOrPassword
        {
            get
            {
                return ResourceManager.GetString("ErrorBadUserNameOrPassword", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Registration was successful but there was a problem while trying to log in with your credentials: {0}.
        /// </summary>
        public static string ErrorLoginAfterRegistrationFailed
        {
            get
            {
                return ResourceManager.GetString("ErrorLoginAfterRegistrationFailed", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Error Details.
        /// </summary>
        public static string ErrorWindowErrorDetails
        {
            get
            {
                return ResourceManager.GetString("ErrorWindowErrorDetails", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to An unknown error has occurred. Please contact your administrator for help..
        /// </summary>
        public static string ErrorWindowGenericError
        {
            get
            {
                return ResourceManager.GetString("ErrorWindowGenericError", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Error.
        /// </summary>
        public static string ErrorWindowTitle
        {
            get
            {
                return ResourceManager.GetString("ErrorWindowTitle", resourceCulture);
            }
        }
    }
}
