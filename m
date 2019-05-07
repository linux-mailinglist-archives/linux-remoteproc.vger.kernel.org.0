Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF20164AC
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 May 2019 15:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfEGNhZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 May 2019 09:37:25 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25152 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726362AbfEGNhY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 May 2019 09:37:24 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x47DXDBj018930;
        Tue, 7 May 2019 15:37:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=QJ/A975AuBF/01Q++fbenxXAwASN992l1ZAqsSdcWbA=;
 b=0/l/yyBC64EMopiEUvB6CBZbnQOxAHJtabeEW6N1tN8r23GCEApAiiLo4UFcEqYHWq9e
 rT+2vJBo76KUvgwZPWDyv5h+G7GpVPVg+8s5H+WHmajZojA/oCfz+CIdkRykOP2H/ShC
 +CNpBtkW0VcLw6C+xvPWfagLGtTfpBm/JDyFua6TfDckK/CnlanoRZAsa2B5EmXjXp2u
 c0A6vR058H16ouYi9bOxSUNNsA35JgraivNhYFd3GDOUCDaA1R9DkaRwVjDGD4sRtnYe
 iU5G/azyeR/iks2c3ZvjGPiyFzdrZWy0pEtnpNtGRBfp5AUEA/7K5++h6gSCHsccgq3g fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2s94cbg4kv-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 07 May 2019 15:37:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98C8934;
        Tue,  7 May 2019 13:37:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60E0428DB;
        Tue,  7 May 2019 13:37:15 +0000 (GMT)
Received: from [10.48.0.131] (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 May
 2019 15:37:14 +0200
Subject: Re: [RFC PATCH] rproc: Add elf64 support in elf loader
To:     =?UTF-8?Q?Cl=c3=a9ment_Leger?= <cleger@kalray.eu>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Loic PALLARDY <loic.pallardy@st.com>
References: <200341833.8193594.1554193736818.JavaMail.zimbra@kalray.eu>
 <2077801405.670546.1557230986215.JavaMail.zimbra@kalray.eu>
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
Openpgp: preference=signencrypt
Autocrypt: addr=arnaud.pouliquen@st.com; prefer-encrypt=mutual; keydata=
 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
 8mOik8I/F6EW8XyQAA2P
Message-ID: <04be3345-698d-29b0-7b4b-7eed088e490d@st.com>
Date:   Tue, 7 May 2019 15:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2077801405.670546.1557230986215.JavaMail.zimbra@kalray.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-07_07:,,
 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Clément,

I tested your patch on stm32MP1, no regression observed when loading my
ELF32 firmware.
Now i'm not enough expert on the loader to ack your patch.
For stm32 MP1 platform:
Tested-by: Arnaud POULIQUEN <arnaud.pouliquen@st.com>

Please find few remarks in your code

Regards
Arnaud

On 5/7/19 2:09 PM, Clément Leger wrote:
> Ping ?
> 
> ----- Original Message -----
> From: "Clément Leger" <cleger@kalray.eu>
> To: "linux-remoteproc" <linux-remoteproc@vger.kernel.org>, "Ohad Ben-Cohen" <ohad@wizery.com>, "Bjorn Andersson" <bjorn.andersson@linaro.org>
> Cc: "Loic PALLARDY" <loic.pallardy@st.com>
> Sent: Tuesday, 2 April, 2019 10:28:56
> Subject: [RFC PATCH] rproc: Add elf64 support in elf loader
> 
> elf32 and elf64 mainly differ by their types. In order to avoid
> copy/pasting the whole loader code, generate static inline functions
> which will access values according to the elf class. It allows to keep a
> common loader basis.
> In order to accomodate both elf types sizes, the maximum size for a
> elf header member is chosen using the maximum value of both elf class.
> 
> Signed-off-by: Clement Leger <clement.leger@kalray.eu>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 130 +++++++++++++++++------------
>  drivers/remoteproc/remoteproc_elf_loader.h |  78 +++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h   |   2 +-
>  include/linux/remoteproc.h                 |   4 +-
>  4 files changed, 159 insertions(+), 55 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_elf_loader.h
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index b17d72ec8603..f6aefa46e45c 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -31,6 +31,7 @@
>  #include <linux/elf.h>
>  
>  #include "remoteproc_internal.h"
> +#include "remoteproc_elf_loader.h"
>  
>  /**
>   * rproc_elf_sanity_check() - Sanity Check ELF firmware image
> @@ -44,7 +45,10 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  	const char *name = rproc->firmware;
>  	struct device *dev = &rproc->dev;
>  	struct elf32_hdr *ehdr;
This is confusing because this function handles elf64 and elf32, i
suggest using  e_ident table pointer directly, or adding a comment as in
remoteproc_elf_loader.h
> +	u32 elf_shdr_size;
> +	u64 phoff, shoff;
>  	char class;
> +	u16 phnum;
>  
>  	if (!fw) {
>  		dev_err(dev, "failed to load %s\n", name);
> @@ -58,9 +62,13 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  
>  	ehdr = (struct elf32_hdr *)fw->data;
>  
> -	/* We only support ELF32 at this point */
> +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> +		dev_err(dev, "Image is corrupted (bad magic)\n");
> +		return -EINVAL;
> +	}
> +
>  	class = ehdr->e_ident[EI_CLASS];
> -	if (class != ELFCLASS32) {
> +	if (class != ELFCLASS32 && class != ELFCLASS64) {
>  		dev_err(dev, "Unsupported class: %d\n", class);
>  		return -EINVAL;
>  	}
> @@ -75,26 +83,29 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  		return -EINVAL;
>  	}
>  
> -	if (fw->size < ehdr->e_shoff + sizeof(struct elf32_shdr)) {
> -		dev_err(dev, "Image is too small\n");
> -		return -EINVAL;
> -	}
> +	phoff = elf_hdr_e_phoff(class, fw->data);
> +	shoff = elf_hdr_e_shoff(class, fw->data);
> +	phnum =  elf_hdr_e_phnum(class, fw->data);
> +	elf_shdr_size = elf_size_of_shdr(class);
>  
> -	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> -		dev_err(dev, "Image is corrupted (bad magic)\n");
> +	if (fw->size < shoff + elf_shdr_size) {
> +		dev_err(dev, "Image is too small\n");
>  		return -EINVAL;
>  	}
>  
> -	if (ehdr->e_phnum == 0) {
> +	if (phnum == 0) {
>  		dev_err(dev, "No loadable segments\n");
>  		return -EINVAL;
>  	}
>  
> -	if (ehdr->e_phoff > fw->size) {
> +	if (phoff > fw->size) {
>  		dev_err(dev, "Firmware size is too small\n");
>  		return -EINVAL;
>  	}
>  
> +	dev_dbg(dev, "Firmware is an elf%d file\n",
> +		class == ELFCLASS32 ? 32 : 64);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(rproc_elf_sanity_check);
> @@ -110,11 +121,9 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
>   * Note that the boot address is not a configurable property of all remote
>   * processors. Some will always boot at a specific hard-coded address.
>   */
> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
> -
> -	return ehdr->e_entry;
> +	return elf_hdr_e_entry(fw_elf_get_class(fw), fw->data);
>  }
>  EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>  
> @@ -145,37 +154,41 @@ EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = &rproc->dev;
> -	struct elf32_hdr *ehdr;
> -	struct elf32_phdr *phdr;
> +	const void *ehdr, *phdr;
>  	int i, ret = 0;
> +	u16 phnum;
>  	const u8 *elf_data = fw->data;
> +	u8 class = fw_elf_get_class(fw);
> +	u32 elf_phdr_size = elf_size_of_phdr(class);
>  
> -	ehdr = (struct elf32_hdr *)elf_data;
> -	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
> +	ehdr = elf_data;
> +	phnum = elf_hdr_e_phnum(class, ehdr);
> +	phdr = elf_data + elf_hdr_e_phoff(class, ehdr);
>  
>  	/* go through the available ELF segments */
> -	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
> -		u32 da = phdr->p_paddr;
> -		u32 memsz = phdr->p_memsz;
> -		u32 filesz = phdr->p_filesz;
> -		u32 offset = phdr->p_offset;
> +	for (i = 0; i < phnum; i++, phdr += elf_phdr_size) {
> +		u64 da = elf_phdr_p_paddr(class, phdr);
> +		u64 memsz = elf_phdr_p_memsz(class, phdr);
> +		u64 filesz = elf_phdr_p_filesz(class, phdr);
> +		u64 offset = elf_phdr_p_offset(class, phdr);
> +		u32 type = elf_phdr_p_type(class, phdr);
>  		void *ptr;
>  
> -		if (phdr->p_type != PT_LOAD)
> +		if (type != PT_LOAD)
>  			continue;
>  
> -		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
> -			phdr->p_type, da, memsz, filesz);
> +		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
> +			type, da, memsz, filesz);
>  
>  		if (filesz > memsz) {
> -			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
> +			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
>  				filesz, memsz);
>  			ret = -EINVAL;
>  			break;
>  		}
>  
>  		if (offset + filesz > fw->size) {
> -			dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
> +			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
>  				offset + filesz, fw->size);
>  			ret = -EINVAL;
>  			break;
> @@ -184,14 +197,15 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		/* grab the kernel address for this device address */
>  		ptr = rproc_da_to_va(rproc, da, memsz);
>  		if (!ptr) {
> -			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
> +			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> +				memsz);
>  			ret = -EINVAL;
>  			break;
>  		}
>  
>  		/* put the segment where the remote processor expects it */
> -		if (phdr->p_filesz)
> -			memcpy(ptr, elf_data + phdr->p_offset, filesz);
> +		if (filesz)
> +			memcpy(ptr, elf_data + offset, filesz);
>  
>  		/*
>  		 * Zero out remaining memory for this segment.
> @@ -208,24 +222,32 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  }
>  EXPORT_SYMBOL(rproc_elf_load_segments);
>  
> -static struct elf32_shdr *
> -find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
> +static const void *
> +find_table(struct device *dev, const struct firmware *fw)
>  {
> -	struct elf32_shdr *shdr;
> +	const void *shdr, *name_table_shdr;
>  	int i;
>  	const char *name_table;
>  	struct resource_table *table = NULL;
> -	const u8 *elf_data = (void *)ehdr;
> +	const u8 *elf_data = (void *)fw->data;
> +	u8 class = fw_elf_get_class(fw);
> +	size_t fw_size = fw->size;
> +	const void *ehdr = elf_data;
> +	u16 shnum = elf_hdr_e_shnum(class, ehdr);
> +	u32 elf_shdr_size = elf_size_of_shdr(class);
> +	u16 shstrndx = elf_hdr_e_shstrndx(class, ehdr);
>  
>  	/* look for the resource table and handle it */
> -	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
> -	name_table = elf_data + shdr[ehdr->e_shstrndx].sh_offset;
> +	shdr = elf_data + elf_hdr_e_shoff(class, ehdr);
> +	name_table_shdr = shdr + (shstrndx * elf_shdr_size);
> +	name_table = elf_data + elf_shdr_sh_offset(class, name_table_shdr);
>  
> -	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
> -		u32 size = shdr->sh_size;
> -		u32 offset = shdr->sh_offset;
> +	for (i = 0; i < shnum; i++, shdr += elf_shdr_size) {
> +		u64 size = elf_shdr_sh_size(class, shdr);
> +		u64 offset = elf_shdr_sh_offset(class, shdr);
> +		u32 name = elf_shdr_sh_name(class, shdr);
>  
> -		if (strcmp(name_table + shdr->sh_name, ".resource_table"))
> +		if (strcmp(name_table + name, ".resource_table"))
>  			continue;
>  
>  		table = (struct resource_table *)(elf_data + offset);
> @@ -279,21 +301,21 @@ find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
>   */
>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr;
> -	struct elf32_shdr *shdr;
> +	const void *shdr;
>  	struct device *dev = &rproc->dev;
>  	struct resource_table *table = NULL;
>  	const u8 *elf_data = fw->data;
>  	size_t tablesz;
> +	u8 class = fw_elf_get_class(fw);
> +	u64 sh_offset;
>  
> -	ehdr = (struct elf32_hdr *)elf_data;
> -
> -	shdr = find_table(dev, ehdr, fw->size);
> +	shdr = find_table(dev, fw);
>  	if (!shdr)
>  		return -EINVAL;
>  
> -	table = (struct resource_table *)(elf_data + shdr->sh_offset);
> -	tablesz = shdr->sh_size;
> +	sh_offset = elf_shdr_sh_offset(class, shdr);
> +	table = (struct resource_table *)(elf_data + sh_offset);
> +	tablesz = elf_shdr_sh_size(class, shdr);
>  
>  	/*
>  	 * Create a copy of the resource table. When a virtio device starts
> @@ -326,13 +348,17 @@ EXPORT_SYMBOL(rproc_elf_load_rsc_table);
>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>  						       const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
> -	struct elf32_shdr *shdr;
> +	const void *shdr;
> +	u64 sh_addr, sh_size;
> +	u8 class = fw_elf_get_class(fw);
>  
> -	shdr = find_table(&rproc->dev, ehdr, fw->size);
> +	shdr = find_table(&rproc->dev, fw);
>  	if (!shdr)
>  		return NULL;
>  
> -	return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
> +	sh_addr = elf_shdr_sh_addr(class, shdr);
> +	sh_size = elf_shdr_sh_size(class, shdr);
> +
> +	return rproc_da_to_va(rproc, sh_addr, sh_size);
>  }
>  EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.h b/drivers/remoteproc/remoteproc_elf_loader.h
> new file mode 100644
> index 000000000000..e37a55c61eae
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_elf_loader.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Remote processor elf loader defines
> + *
> + * Copyright (C) 2019 Kalray, Inc.
The rest of the header should be cleaned
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef REMOTEPROC_ELF_LOADER_H
> +#define REMOTEPROC_ELF_LOADER_H
> +
> +#include <linux/elf.h>
> +#include <linux/types.h>
> +
> +/**
> + * fw_elf_get_class - Get elf class
> + * @fw: the ELF firmware image
> + *
> + * Note that we use and elf32_hdr to access the class since the start of the
> + * struct is the same for both elf class
> + *
> + * Return: elf class of the firmware
> + */
> +static inline u8 fw_elf_get_class(const struct firmware *fw)
> +{
> +	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
> +
> +	return ehdr->e_ident[EI_CLASS];
> +}
> +
> +#define ELF_GET_FIELD(__s, __field, __type) \
> +static inline __type elf_##__s##_##__field(u8 class, const void *arg) \
> +{ \
> +	if (class == ELFCLASS32) \
> +		return (__type) ((const struct elf32_##__s *) arg)->__field; \
> +	else \
> +		return (__type) ((const struct elf64_##__s *) arg)->__field; \
> +}
> +
> +ELF_GET_FIELD(hdr, e_entry, u64)
> +ELF_GET_FIELD(hdr, e_phnum, u16)
> +ELF_GET_FIELD(hdr, e_shnum, u16)
> +ELF_GET_FIELD(hdr, e_phoff, u64)
> +ELF_GET_FIELD(hdr, e_shoff, u64)
> +ELF_GET_FIELD(hdr, e_shstrndx, u16)
> +
> +ELF_GET_FIELD(phdr, p_paddr, u64)
> +ELF_GET_FIELD(phdr, p_filesz, u64)
> +ELF_GET_FIELD(phdr, p_memsz, u64)
> +ELF_GET_FIELD(phdr, p_type, u32)
> +ELF_GET_FIELD(phdr, p_offset, u64)
> +
> +ELF_GET_FIELD(shdr, sh_size, u64)
> +ELF_GET_FIELD(shdr, sh_offset, u64)
> +ELF_GET_FIELD(shdr, sh_name, u32)
> +ELF_GET_FIELD(shdr, sh_addr, u64)
> +
> +#define ELF_STRUCT_SIZE(__s) \
> +static inline unsigned long elf_size_of_##__s(u8 class) \
> +{ \
> +	if (class == ELFCLASS32)\
> +		return sizeof(struct elf32_##__s); \
> +	else \
> +		return sizeof(struct elf64_##__s); \
> +}
> +
> +ELF_STRUCT_SIZE(shdr)
> +ELF_STRUCT_SIZE(phdr)
> +
> +#endif /* REMOTEPROC_ELF_LOADER_H */
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index b02b15f74a5e..6d4a5ffcb28b 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -55,7 +55,7 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
>  int rproc_trigger_recovery(struct rproc *rproc);
>  
>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a3edd981220e..9a7c4c3f1c92 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,7 +381,7 @@ struct rproc_ops {
>  				struct rproc *rproc, const struct firmware *fw);
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> -	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  };
>  
>  /**
> @@ -497,7 +497,7 @@ struct rproc {
>  	int num_traces;
>  	struct list_head carveouts;
>  	struct list_head mappings;
> -	u32 bootaddr;
> +	u64 bootaddr;
This generates a warning in remote proc:
drivers/remoteproc/st_remoteproc.c:196:24: warning: format ‘%x’ expects
argument of type ‘unsigned int’, but argument 3 has type ‘u64’ {aka
‘long long unsigned int’} [-Wformat=]
  dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
>  	struct list_head rvdevs;
>  	struct list_head subdevs;
>  	struct idr notifyids;
> 
