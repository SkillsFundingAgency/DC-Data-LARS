//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ESFA.DC.Data.LARS.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class LARS_Framework
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LARS_Framework()
        {
            this.LARS_FrameworkAims = new HashSet<LARS_FrameworkAims>();
            this.LARS_FrameworkCmnComp = new HashSet<LARS_FrameworkCmnComp>();
            this.LARS_SupersedingFrameworks = new HashSet<LARS_SupersedingFrameworks>();
            this.LARS_SupersedingFrameworks1 = new HashSet<LARS_SupersedingFrameworks>();
        }
    
        public int FworkCode { get; set; }
        public int ProgType { get; set; }
        public int PwayCode { get; set; }
        public string PathwayName { get; set; }
        public Nullable<System.DateTime> EffectiveFrom { get; set; }
        public Nullable<System.DateTime> EffectiveTo { get; set; }
        public Nullable<decimal> SectorSubjectAreaTier1 { get; set; }
        public Nullable<decimal> SectorSubjectAreaTier2 { get; set; }
        public string DataSource { get; set; }
        public string NASTitle { get; set; }
        public Nullable<System.DateTime> ImplementDate { get; set; }
        public string IssuingAuthorityTitle { get; set; }
        public string IssuingAuthority { get; set; }
        public Nullable<System.DateTime> DataReceivedDate { get; set; }
        public Nullable<int> MI_FullLevel2 { get; set; }
        public Nullable<decimal> MI_FullLevel2Percent { get; set; }
        public Nullable<int> MI_FullLevel3 { get; set; }
        public Nullable<decimal> MI_FullLevel3Percent { get; set; }
        public string CurrentVersion { get; set; }
        public System.DateTime Created_On { get; set; }
        public string Created_By { get; set; }
        public System.DateTime Modified_On { get; set; }
        public string Modified_By { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_FrameworkAims> LARS_FrameworkAims { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_FrameworkCmnComp> LARS_FrameworkCmnComp { get; set; }
        public virtual LARS_FrameworkMetaData LARS_FrameworkMetaData { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_SupersedingFrameworks> LARS_SupersedingFrameworks { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LARS_SupersedingFrameworks> LARS_SupersedingFrameworks1 { get; set; }
    }
}
