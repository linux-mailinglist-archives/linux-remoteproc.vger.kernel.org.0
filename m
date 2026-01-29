Return-Path: <linux-remoteproc+bounces-6308-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAcbCHiae2nOGAIAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6308-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Jan 2026 18:35:52 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DDFB2FA2
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Jan 2026 18:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F67E3002A25
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Jan 2026 17:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D133F34F24E;
	Thu, 29 Jan 2026 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRiczQ3R"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E5346AF9;
	Thu, 29 Jan 2026 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707973; cv=none; b=fzkc/PD1k9ls/+fBy6soPeYkNYBj7A5X45UEcTvZ+SdB8XDMQJXfxZ6OBk0htd8jw8YxgwjFDK3RABVnstwu31+KELNDjxkADLzRmGcsfA+Htesc0OqpesegGwPvRu2jrpwBrZ6ReGmBw+tPRaWaJpw8+y+gSr8BcIcFK0lrJ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707973; c=relaxed/simple;
	bh=HlRcXWh5Jpr3Xxla8uDIVDBLndWvusZX9KH5OKRs+Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtoWvUqUmWdZQsqOcaDnpIR9DUo+Wgh4TJ1Xy1Jqe8bPIdszGKy3eixu9NY5o0lcRorABWZZRSreiJ977aeEIVzPtFM7w4U4gT26YdeiJhWsmvEIiEij9LBMKNAtZoL90jHVAACC0LQu5AgodmVO+4flhd8T+4QWJvnKnFnJthg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRiczQ3R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3474CC116D0;
	Thu, 29 Jan 2026 17:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769707973;
	bh=HlRcXWh5Jpr3Xxla8uDIVDBLndWvusZX9KH5OKRs+Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRiczQ3Rcs/s8HQISEftm6wjnwi52XySPsrJ+ybcc+/iY1/aMy840cjLtllw7R5qo
	 ND1nBQRikO8/JRCrR4C831cNKjWLr3lE3/Q7t+m2zgRTpj6jOWokikOvk0B2kN7fp1
	 zd2ykmmRIdarNdzOzfYQ9ftG7fkzAWLwFlevpTtX82gr7NYxpjO+pO8K5NzkPVYLso
	 72xdbyHPFnKgUfru3l/v3YbkixdmyUBeGQ02XC0KcPxQDA8KVhZqBFz8LC1ejXOVsK
	 KWB0BtD2uvpExn+P1Uc7xkctook+xZN3zKc9lJw8l+CrsGbqUkmnY1n8EmXoc5AvoW
	 Os7UcRAkTD4rA==
Date: Thu, 29 Jan 2026 11:32:52 -0600
From: Rob Herring <robh@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
Message-ID: <20260129173252.GA1309005-robh@kernel.org>
References: <20260126120658.1674253-1-valentina.fernandezalanis@microchip.com>
 <20260126120658.1674253-2-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126120658.1674253-2-valentina.fernandezalanis@microchip.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6308-lists,linux-remoteproc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-remoteproc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,microchip.com:email]
X-Rspamd-Queue-Id: 75DDFB2FA2
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 12:06:57PM +0000, Valentina Fernandez wrote:
> Microchip RISC-V SoCs typically contain one or more clusters. Clusters
> can operate in Asymmetric Multi-Processing (AMP) mode, where individual
> cores or groups of cores run as independent software contexts.
> 
> The compatible is intentionally generic, representing a “generic” SBI
> ecall interface to a set of remote processors, with the platform
> abstracted  via SBI ecalls. The IPC/IHC (named differently depending on
> whether it is RTL for the FPGA fabric or a hardened version) is
> intended for Asymmetric Multiprocessing, where a set of cores or
> clusters can run other firmware, such as Zephyr.
> 
> Unlike platforms with a fixed DSP, the configuration here is variable
> even for a single SoC. For example, which memory regions are used for
> the remote cluster or which mailbox channel is selected. This binding
> documents that firmware interface.
> 
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
>  .../microchip,ipc-sbi-remoteproc.yaml         | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> new file mode 100644
> index 000000000000..6fc0ab7f3ffb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-sbi-remoteproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip IPC Remote Processor
> +
> +description:

Need '>' to maintain paragraph formatting.

> +  Microchip RISC-V SoCs typically contain one or more clusters. Clusters can
> +  operate in Asymmetric Multi-Processing (AMP) mode, where individual cores
> +  or groups of cores run as independent software contexts.
> +
> +  The configuration is flexible, as the set of cores or clusters that can be
> +  controlled as remote processors may vary, and memory regions used for
> +  firmware as well as mailbox assignments depend on the system design.
> +
> +  Communication with remote cores or clusters is abstracted using ecalls
> +  to the platform's Supervisor Binary Interface (SBI) firmware, through
> +  which the state of remote cores or clusters are controlled. This binding
> +  documents that firmware interface.
> +
> +maintainers:
> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,ipc-sbi-remoteproc
> +
> +  cpu:
> +    description:
> +      phandles to the CPUs comprising the remote cluster

More than 1? Then should be 'cpus'.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type. Drop.

> +
> +  mboxes:
> +    description:
> +      Microchip IPC mailbox specifier. Used for communication with
> +      a remote cluster. For HSS versions prior to v2026.04, it is also
> +      used for controlling the life cycle of a remote cluster. The
> +      specifier format is as per the bindings in
> +      Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> +    maxItems: 1
> +
> +  memory-region:
> +    minItems: 1
> +    maxItems: 5
> +    description:
> +      List of phandles to the reserved memory regions associated wih the
> +      remoteproc device. This is variable and describes the memories shared
> +      with the remote cluster (e.g. firmware, resource table, rpmsg vrings)
> +    items:
> +      anyOf:
> +        - description: resource table when firmware is started by the bootloader
> +        - description: remote cluster firmware image section
> +        - description: virtio device (vdev) buffer
> +        - description: vring0
> +        - description: vring1
> +
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      anyOf:

Use 'enum'

> +        - const: rsc-table
> +        - const: firmware
> +        - const: buffer
> +        - const: vring0
> +        - const: vring1
> +
> +required:
> +  - compatible
> +
> +# Remote Cluster ID is derived either from the CPU phandle or
> +# from the mailbox specifier prior to HSS v2026.04
> +anyOf:
> +  - required:
> +      - cpu
> +  - required:
> +      - mboxes
> +
> +allOf:
> +  - if:
> +      properties:
> +        memory-region-names:
> +          contains:
> +            enum:
> +              - vring0
> +              - vring1
> +    then:
> +      properties:
> +        memory-region-names:
> +          contains:
> +            const: buffer
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Early boot mode example - firmware started by bootloader
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        remoteproc {
> +            compatible = "microchip,ipc-sbi-remoteproc";
> +            cpu = <&cpu4>;
> +            mboxes= <&ihc 8>;
> +            memory-region = <&rsctable>, <&vdev0buffer>,
> +                            <&vdev0vring0>, <&vdev0vring1>;
> +            memory-region-names = "rsc-table", "buffer",
> +                                  "vring0", "vring1";
> +        };
> +    };
> +
> +  - |
> +    // Late boot mode example - firmware started by Linux (remoteproc)
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        remoteproc {
> +            compatible = "microchip,ipc-sbi-remoteproc";
> +            cpu = <&cpu4>;
> +            mboxes= <&ihc 8>;
> +            memory-region = <&cluster_firmware>, <&vdev0buffer>,
> +                            <&vdev0vring0>, <&vdev0vring1>;
> +            memory-region-names = "firmware", "buffer",
> +                                  "vring0", "vring1";
> +        };
> +    };
> +...
> -- 
> 2.34.1
> 

