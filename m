Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC05181E6E
	for <lists+linux-remoteproc@lfdr.de>; Wed, 11 Mar 2020 17:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbgCKQzE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 11 Mar 2020 12:55:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43331 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbgCKQzD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Mar 2020 12:55:03 -0400
Received: by mail-pl1-f195.google.com with SMTP id f8so1356994plt.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2020 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WNLbjKiHSceRgr6cQ58fNCACo44+Y3IkkPkET6P2K5I=;
        b=LO8S+ooAEzLm8EFwu7LhW+YG+Ys/a9yN7vQ6QBK+quHcxf3ygzoZOqjadBL4Pa46wL
         r2Aa7JsanMaPjeB4LyzhJlwvtKP4GlfyGHm+3wabLEMIzG5bCbQmrgBT3XMn704XieCv
         sJhA8osNJvA57u5iejioVqD0siIm0sJsf+DwJIb/Kx6G2d4PQ78CfU733aBf9aMjcywM
         XK7nfTUbGLz/urz39h9lQt9JdTbdmtC/QDJW6R2r17omg2Rjhy7TMDRczNjB10F6y2PE
         9dOBuEYTw0yk1WfTzLyjC8UXIkBXr+OZ1VJrw5MnBQRmipiflmTutzHw3rGXQbs07twN
         cHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WNLbjKiHSceRgr6cQ58fNCACo44+Y3IkkPkET6P2K5I=;
        b=gH7DUzQ6VbM4Bmg33KsbJvoYfPPq1/3oMQVGdHTw91eTYfo0lf66dT31M0fE3yjv2x
         TjucVkn9QC7Xopv8Ul8jcuUuudFL2eZp7yp1INGcLgwVOgL3alkUmahVJWSB3cD8BLL+
         d64EbckFRc0vYUKXBoMq9ta/DATY/opANGYD+mXaiw7G/DTdE7ReP+Cb8BQyJ+pNkR3w
         yXDQXFqZmtPp2dcwcSS4gAnJ0+qD9duQeGTr4+fRx9RnRcwXvDTLBWx+09B56dFN/Ed0
         q+yD2CignYmNvlP6+jQOi2YffLxG/OaWycaDUJHs5uGYmyArHx7d1JlTTCIVQLiUMUsd
         XOzQ==
X-Gm-Message-State: ANhLgQ1ur4NE8tC0Bo2YZ8kKU0PYMvO/VQmwqb8mpXZwpvPkTXnHj/fY
        X2xr7gY83IuTXhU4hvXRTmhTXg==
X-Google-Smtp-Source: ADFU+vtZy8bz+TL4oXAdmhLSo2whRQCy+AitraDoObkHe1Vy97p2kA4if9aIqs6KZtF2o6K8+1hnPA==
X-Received: by 2002:a17:902:d915:: with SMTP id c21mr3904174plz.239.1583945702872;
        Wed, 11 Mar 2020 09:55:02 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id w24sm5911609pjh.26.2020.03.11.09.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 09:55:02 -0700 (PDT)
Date:   Wed, 11 Mar 2020 10:55:00 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jason Wu <j.wu@xilinx.com>,
        Wendy Liang <jliang@xilinx.com>
Subject: Re: [PATCH 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20200311165500.GB32395@xps15>
References: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
 <1582566751-13118-5-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582566751-13118-5-git-send-email-ben.levinsky@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Feb 24, 2020 at 09:52:30AM -0800, Ben Levinsky wrote:
> From: Jason Wu <j.wu@xilinx.com>
> 
> Add binding for ZynqMP R5 OpenAMP.
> 
> Represent the RPU domain resources in one device node. Each RPU
> processor is a subnode of the top RPU domain node.
> 
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Other than the yaml format that you've already taken care of, I have the
following comments:

> ---
>  .../remoteproc/xilinx,zynqmp-r5-remoteproc.txt     | 135 +++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.txt
> new file mode 100644
> index 0000000..ee7a515
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.txt
> @@ -0,0 +1,135 @@
> +Xilinx ARM Cortex A53-R5 remoteproc driver
> +==========================================
> +
> +ZynqMP family of devices use two Cortex R5 processors to help with various
> +low power / real time tasks.
> +
> +This driver requires specific ZynqMP hardware design.
> +
> +ZynqMP R5 Device Node:
> +=================================
> +A ZynqMP R5 device node is used to represent RPU domain
> +within ZynqMP SoC. This device node contains RPU processor
> +subnodes.
> +
> +Required Properties:
> +--------------------
> + - compatible : Should be "xlnx,zynqmp-r5-remoteproc-1.0"
> + - core_conf : R5 core configuration (valid string - split or lock-step)

Please describe "split" and "lock-step".  I am guessing that split means
core run independently from one another while lock-step is an smp configuration.
But event that is not clear from the implementation in patch 5.  I also assume
the property has no relevance when there is only one core.

> + - interrupts : Interrupt mapping for remoteproc IPI. It is required if the
> +                user uses the remoteproc driver with the RPMsg kernel driver.
> + - interrupt-parent : Phandle for the interrupt controller. It is required if
> +                      the user uses the remoteproc driver with the RPMsg kernel
> +                      kernel driver.

I can't find the interrupts and interrupts-parent properties under the
zynqmp-r5-remoteproc node.  But I do see them under the zynqmp_ipi node.  As
such there is a discrepancy between the above and the example.

> +
> +ZynqMP R5 Remoteproc Device Node:
> +=================================
> +A ZynqMP R5 Remoteproc device node is used to represent a RPU processor.
> +It is a subnode to the ZynqMP R5 device node. It also contains tightly
> +coupled memory subnodes.
> +
> +Required Properties:
> +--------------------
> + - pnode-id:	ZynqMP R5 processor power domain ID which will be used by
> +		ZynqMP power management unit to idetify the processor.
> +
> +Optional Properties:
> +--------------------
> + - memory-region: reserved memory which will be used by R5 processor
> +
> +
> +ZynqMP R5 Remoteproc Device Node:
> +=================================
> +A ZynqMP R5 Remoteproc device node is used to represent a RPU processor.
> +It is a subnode to the ZynqMP R5 device node.
> +
> +Required Properties:
> +--------------------
> + - pnode-id:	ZynqMP R5 processor power domain ID which will be used by
> +		ZynqMP power management unit to idetify the processor.
> +
> +Optional Properties:
> +--------------------
> + - memory-region:	reserved memory which will be used by R5 processor
> + - mboxes:		Specify tx and rx mailboxes
> + - mbox-names:		List of identifier strings for tx/rx mailbox channel.

This section is already laid out above, but this (other) one
has mboxes and mbox-names.  Please reorganise. 

> +
> +ZynqMP R5 TCM Device Node:
> +=================================
> +The ZynqMP R5 TCM device node is used to represent the TCM memory.
> +It is a subnode to the ZynqMP R5 processor.
> +
> +Required Properties:
> +--------------------
> + - reg:		TCM address range
> + - pnode-id:	TCM power domain ID
> +
> +
> +Example:
> +--------
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		/* R5 0 firmware memory in DDR */
> +		rproc_0_fw_reserved: rproc@3ed000000 {
> +			no-map;
> +			reg = <0x0 0x3ed00000 0x0 0x40000>;
> +		};
> +		/* DMA shared memory between APU and RPU */
> +		rpu0vdev0buffer: rpu0vdev0buffer@3ed400000 {
> +			compatible = "shared-dma-pool";
> +			no-map;
> +			reg = <0x0 0x3ed40000 0x0 0x100000>;
> +		};
> +	};
> +
> +	zynqmp-r5-remoteproc@0 {
> +		compatible = "xlnx,zynqmp-r5-remoteproc-1.0";
> +		core_conf = "split";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		r5-0: r5@0 {
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			memory-region = <&rproc_0_fw_reserved>,
> +					<&rpu0vdev0buffer>;
> +			pnode-id = <0x7>;
> +			mboxes = <&ipi_mailbox_rpu0 0>, <&ipi_mailbox_rpu0 1>;
> +			mbox-names = "tx", "rx";
> +			tcm-a: tcm@0 {
> +				reg = <0x0 0xFFE00000 0x0 0x10000>,
> +				pnode-id = <0xf>;
> +			};
> +			tcm-b: tcm@1 {
> +				reg = <0x0 0xFFE20000 0x0 0x10000>,
> +				pnode-id = <0x10>;
> +			};
> +		};
> +	} ;
> +
> +	zynqmp_ipi {
> +		compatible = "xlnx,zynqmp-ipi-mailbox";
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 29 4>;
> +		xlnx,ipi-id = <7>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		/* APU<->RPU0 IPI mailbox controller */
> +		ipi_mailbox_rpu0: mailbox@ff90600 {
> +			reg = <0xff990600 0x20>,
> +			      <0xff990620 0x20>,
> +			      <0xff9900c0 0x20>,
> +			      <0xff9900e0 0x20>;
> +			reg-names = "local_request_region",
> +				    "local_response_region",
> +				    "remote_request_region",
> +				    "remote_response_region";
> +			#mbox-cells = <1>;
> +			xlnx,ipi-id = <1>;
> +		};
> +	};
> -- 
> 2.7.4
> 
