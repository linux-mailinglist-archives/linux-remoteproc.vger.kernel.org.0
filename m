Return-Path: <linux-remoteproc+bounces-3963-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BC4AD998D
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Jun 2025 03:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D851BC1194
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Jun 2025 01:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3C938DE1;
	Sat, 14 Jun 2025 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pq1DapCU"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8295979D0;
	Sat, 14 Jun 2025 01:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749866268; cv=none; b=RFZbVLVEjMxL69eimSefiaaNAyLvwZXGwEiBUEQybRXSG/NDIB+AomTr828FDTSz1j5Shmkp01NrH6VvsLNFRsqOcbX5bV9lfadM9rkkKg0XzGIX/n5/igc/Bg4sY4w8A8WuJFRJW1EQOZU1Qqvci886X/zL2KVJcpZOEeGjleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749866268; c=relaxed/simple;
	bh=mO3W2NrTpePz2f5jjCKTmlMxf7yt84jHJqEni8pvzzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAH3nXaek6hpXJ36/CUVplY0fr0sj3ANwUmGWn+cplIDFxLFJ+/g9h6a89DZmrt/uMD0EVM4OMt9aXY+2IsfZCkq8arJDp2X+1qVWH3JugEF5XSQ0OnkABiT1xEdZ8QTqAQrnQ5K1MawxWSHMey4qVaG05o/NPMjXryrTxmAH3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pq1DapCU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749866266; x=1781402266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mO3W2NrTpePz2f5jjCKTmlMxf7yt84jHJqEni8pvzzY=;
  b=Pq1DapCUW23eHvUpUmONbtUJRFX9iKDqrBMBXz0leVY5jsQ39INOjn5o
   ZiBRSDj+oH0W6DQXvzvGCzaVOd1Ksu4deH0jpZ2jTEGzWaaR+jBotXb3u
   mZZUlfqhp5usGdy6jjPHpMU6xEctXX4Hz45eI6mqyrJZfvZbNscKtDOM4
   mtp2HUA9NosF1+2eX8rdufgmXjRFM3OJKyhoaB27EE41vPV0qqgpMgX7n
   2S6G4edx9ediRZ54QTMC9VB8adleoqeyM2tVYH44oCEwvXWiNRfgOVhzb
   EW27/v0Sw0LGTZnkY9eCP+iCki7DqQySuf79LM5MZLvYqL8Rf7E+q3yLi
   w==;
X-CSE-ConnectionGUID: NOWtrRZzTNeJ6WQUxfNNKA==
X-CSE-MsgGUID: 3uv9C7xsTmOysBO+FvhKWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63124129"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="63124129"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 18:57:45 -0700
X-CSE-ConnectionGUID: 9ihp73UQQ0q/ckjGhmNYaQ==
X-CSE-MsgGUID: k8UR7c6SQAiqWEGGbRhoPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="178969259"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2025 18:57:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQG9K-000DA2-39;
	Sat, 14 Jun 2025 01:57:38 +0000
Date: Sat, 14 Jun 2025 09:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v17 2/6] remoteproc: Add TEE support
Message-ID: <202506140913.N5KmGXj7-lkp@intel.com>
References: <20250613091650.2337411-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613091650.2337411-3-arnaud.pouliquen@foss.st.com>

Hi Arnaud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20250613-172251
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250613091650.2337411-3-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v17 2/6] remoteproc: Add TEE support
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250614/202506140913.N5KmGXj7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140913.N5KmGXj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140913.N5KmGXj7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/chrome/cros_ec_proto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_sensorhub_ring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_usbpd_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/wilco_ec/mailbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-omnia-mcu-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-signing-key.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/olpc/olpc-ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/controller.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/ssh_packet_layer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/surface_acpi_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hsmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hwmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/wbrf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/asus-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dcdbas.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-rbtn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-smbios-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-descriptor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-privacy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/firmware_attributes_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/ideapad-laptop.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/int3472/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/int3472/discrete.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmc/ssram_telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmt/class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmt/telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/punit_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/speed_select_if/isst_if_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/telemetry/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/vsec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/vsec_tpmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel_ips.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel_scu_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/mxm-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/siemens/simatic-ipc-batt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pmdomain/actions/owl-sps-helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pmdomain/rockchip/pm-domains.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/isapnp/compat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/isapnp/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/pnpbios/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/support.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/reset/reboot-mode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/bq27xxx_battery.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/power_supply_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/power_supply_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/samsung-sdi-battery.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/dtpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/idle_inject.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/intel_rapl_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/powercap_sys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/generators/pps_gen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/kapi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/pps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-lpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-sys-manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-vuart.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3av.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3av_cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3stor_lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_clock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_mock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_pch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_qoriq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_vclock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pwm/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pwm/pwm-lpss.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio-access.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/amd/atl/umc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/ras.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/irq_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/mc13xxx-regulator-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/of_regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/rohm-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/wm8350-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/wm8400-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/mtk_scp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/mtk_scp_ipi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/pru_rproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_pil_info.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_q6v5.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_sysmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/remoteproc_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/remoteproc_coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/remoteproc_elf_loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/remoteproc/remoteproc_tee.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/st_slim_rproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/ti_k3_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/reset/amlogic/reset-meson-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/reset/reset-mpfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/reset/reset-simple.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/reset/starfive/reset-starfive-jh71x0.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/mtk_rpmsg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/qcom_glink_native.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/qcom_glink_smem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/qcom_glink_ssr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/qcom_smd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/rpmsg_char.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/rpmsg_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/rpmsg_ns.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/nvmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/rtc-ds1685.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/rtc-omap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/rtc-sa1100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd_devmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd_eer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd_erp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd_ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/keyboard.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/raw3270.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/sclp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/sclp_early.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/sclp_ocf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_34xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_3590.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_std.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/airq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/ccwgroup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/chsc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/cio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/device_fsm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/eadm_sch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/fcx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/isc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/itcw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/qdio_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/scm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/ap_bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/ap_queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/pkey_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/pkey_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_ccamisc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_ep11misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/ctcm_mpc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/fsm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/ism_drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/qeth_core_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/qeth_l2_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/qeth_l3_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/smsgiucv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/sbus/char/bbc_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/53c700.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/arm/fas216.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/arm/msgqueue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/arm/queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/constants.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/cxgbi/libcxgbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/esp_scsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/fcoe/fcoe_ctlr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/fcoe/fcoe_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/fcoe/fcoe_transport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/fdomain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/hisi_sas/hisi_sas_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/hosts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/iscsi_boot_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libfc/fc_fcp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libfc/fc_frame.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libfc/fc_libfc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libfc/fc_lport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libiscsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libiscsi_tcp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libsas/sas_expander.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libsas/sas_init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/megaraid/megaraid_mm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/mpt3sas/mpt3sas_ctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/qla2xxx/qla_target.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/qlogicfas408.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/raid_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_devinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_dh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_error.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_logging.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_proc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

