Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E67194445
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Mar 2020 17:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgCZQ2G (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Mar 2020 12:28:06 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:35458 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgCZQ2F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Mar 2020 12:28:05 -0400
Received: by mail-il1-f196.google.com with SMTP id 7so5945147ill.2;
        Thu, 26 Mar 2020 09:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UbqpA/qctusCoT0I66qEao4xg0yyTmAQC3AIFj3TFBY=;
        b=b7aH1tumEeak9M99h/IzzjBMifbxsHnasLqhItCs6bg9JDhU3yDa/o4l4hb9WX3ydq
         bmc2uOAvzanM8wGQySoeyK7S8T1XgjL92AlmyoviDmJO6imDBGonNOTGlszBUDixhlPe
         4u06KDJvvjK7MwE6DUVc6mILLl1xnOR63a/Y5IF9cM4HCFh69fSGWq2Igit5QTp0SVrG
         TVmc56fLBbDoxCrFDkxdD7GTSTTsLx9vLNzK5JPa7Y9ziERkiM1kbgI1fGL3D0hV/r5z
         WdIS+f3SsbTkitL1Axc6PbJd/mkyW/DTkg6X1WbPdoVHB/sIp6IJracW6yvdfUIjBJ5Q
         jfDA==
X-Gm-Message-State: ANhLgQ0iTy+crxG1NX2wpYjUEDjCXXcKCFx5cDln7XeqC8fvOtXf46xy
        tBLqR9KGsrSuS/l+Qc+c6A==
X-Google-Smtp-Source: ADFU+vu5QgSgYZqJfr7f7Kyd68l8DEG8P2xV4YNobUu7GZucH6gAyAscgLQY3q9Bj69qyNOItBf9XA==
X-Received: by 2002:a92:41c7:: with SMTP id o190mr9261446ila.11.1585240084502;
        Thu, 26 Mar 2020 09:28:04 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id z13sm746046ioh.16.2020.03.26.09.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 09:28:03 -0700 (PDT)
Received: (nullmailer pid 1099 invoked by uid 1000);
        Thu, 26 Mar 2020 16:28:02 -0000
Date:   Thu, 26 Mar 2020 10:28:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 3/7] dt-bindings: remoteproc: Add bindings for R5F
 subsystem on TI K3 SoCs
Message-ID: <20200326162802.GA32328@bogus>
References: <20200324201819.23095-1-s-anna@ti.com>
 <20200324201819.23095-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324201819.23095-4-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 24 Mar 2020 15:18:15 -0500, Suman Anna wrote:
> The Texas Instruments K3 family of SoCs have one or more dual-core
> Arm Cortex R5F processor subsystems/clusters (R5FSS). The clusters
> can be split between multiple voltage domains as well. Add the device
> tree bindings document for these R5F subsystem devices. These R5F
> processors do not have an MMU, and so require fixed memory carveout
> regions matching the firmware image addresses. The nodes require more
> than one memory region, with the first memory region used for DMA
> allocations at runtime. The remaining memory regions are reserved
> and are used for the loading and running of the R5F remote processors.
> The R5F processors can also optionally use any internal on-chip SRAM
> memories either for executing code or using it as fast-access data.
> 
> The added example illustrates the DT nodes for the single R5FSS device
> present on K3 AM65x family of SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Rob,
> 
> The dt_bindings_check seems to throw couple of warnings around the
> usage of ranges because the tooling is adding the #address-cells
> and #size-cells of 1 by default, whereas our actual code uses 2.
> No issues are found with dtbs_check.
> 
> regards
> Suman
> 
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 338 ++++++++++++++++++
>  1 file changed, 338 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dts:23.13-20: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dts:23.13-20: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dts:54.13-56.72: Warning (ranges_format): /example-0/interconnect@100000:ranges: "ranges" property has invalid length (72 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 2)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dt.yaml: interconnect@100000: $nodename:0: 'interconnect@100000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dt.yaml: interconnect@28380000: $nodename:0: 'interconnect@28380000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dt.yaml: mcu-ram@41c00000: 'r5f-sram@0' does not match any of the regexes: '^([a-z]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dt.yaml: mcu-ram@41c00000: $nodename:0: 'mcu-ram@41c00000' does not match '^sram(@.*)?'

See https://patchwork.ozlabs.org/patch/1260966

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
